local adapters = require("codecompanion.adapters")
local base = require("codecompanion.adapters.openai_compatible")
local utils = require("codecompanion.utils.messages")
local log = require("codecompanion.utils.log")
local fmt = string.format
local pp = vim.inspect

-- Vutr Inference API CodeCompanion Adapter
-- SEE: https://github.com/olimorris/codecompanion.nvim/blob/main/doc/ADAPTERS.md
-- NOTE: Adapter settings can be cross-referenced (env ref "${key}", adapter ref "foo.bar.baz")
return adapters.extend(base, {
  -- Adapter name
  name = "vultr",

  -- LLM Chat API endpoint
  url = "https://api.vultrinference.com/v1/chat/completions",

  -- Controls adapter-specific behavior that extends/overrides CodeCompanion defaults
  opts = {
    stream = true,
  },

  -- ENV var source definitions (names, commands, functions, refs)
  env = {
    api_key = "VULTR_INFERENCE_API_KEY",
  },

  -- HTTP request headers
  headers = {
    ["Content-Type"] = "application/json",
    Authorization = "Bearer ${api_key}",
  },

  -- Default request parameters (before schema mapping)
  parameters = {
    model = "qwen2.5-coder-32b-instruct",
    temperature = 1,
    top_p = 1,
    stream = true,
    max_tokens = 512,
  },

  -- Extra curl options
  raw = {
    "--no-buffer",
    "--silent",
  },

  -- LLM Chat API schema
  -- SEE: https://api.vultrinference.com/#tag/Chat/operation/create-chat-completion
  schema = {
    model = {
      order = 1,
      mapping = "parameters",
      type = "enum",
      desc = "The model that will be inferred for chat completion.",
      default = "llama-3.1-70b-instruct-fp8",
      choices = {
        "llama-3.1-70b-instruct-fp8",
        "llama-3.3-70b-instruct",
        "mistral-7b-v0.3",
        "qwen2.5-32b-instruct",
        "qwen2.5-coder-32b-instruct"
      }
    },
    temperature = {
      order = 2,
      mapping = "parameters",
      type = "number",
      optional = true,
      default = 1,
      desc = "What sampling temperature to use, between 0 and 2.",
      validate = function(n)
        return n >= 0 and n <= 2, "Must be between 0 and 2"
      end,
    },
    max_tokens = {
      order = 3,
      mapping = "parameters",
      type = "integer",
      optional = true,
      default = 512,
      desc = "The maximum number of tokens to generate.",
      validate = function(n)
        return n > 0, "Must be greater than 0"
      end,
    },
    top_p = {
      order = 4,
      mapping = "parameters",
      type = "number",
      optional = true,
      default = 1,
      desc = "Nucleus sampling: Consider the smallest set of tokens whose probability sum is top_p.",
      validate = function(n)
        return n >= 0 and n <= 1, "Must be between 0 and 1"
      end,
    },
    frequency_penalty = {
      order = 5,
      mapping = "parameters",
      type = "number",
      optional = true,
      default = 0,
      desc = "Penalty for using frequent tokens (-2.0 to 2.0).",
      validate = function(n)
        return n >= -2 and n <= 2, "Must be between -2 and 2"
      end,
    },
    presence_penalty = {
      order = 6,
      mapping = "parameters",
      type = "number",
      optional = true,
      default = 0,
      desc = "Penalty for using tokens already in the text (-2.0 to 2.0).",
      validate = function(n)
        return n >= -2 and n <= 2, "Must be between -2 and 2"
      end,
    },
    stop = {
      order = 7,
      mapping = "parameters",
      type = "list",
      optional = true,
      desc = "Sequences where the API will stop generating.",
      subtype = {
        type = "string",
      }
    },
    logprobs = {
      order = 8,
      mapping = "parameters",
      type = "boolean",
      optional = true,
      desc = "Return log probabilities of output tokens.",
    },
    top_logprobs = {
      order = 9,
      mapping = "parameters",
      type = "integer",
      optional = true,
      desc = "Return top token log probabilities (0-20).",
      validate = function(n)
        return n >= 0 and n <= 20, "Must be between 0 and 20"
      end,
    }
  },

  features = {
    text = true,
    tokens = true,
    vision = false,
  },

  roles = {
    system = "system",
    user = "user",
    llm = "assistant",
  },

  agents = {
    full_stack_dev = {
      role = "system"
    }
  },

  tools = {
    rag = {
      role = "user",
      auto_submit_success = true
    },
    cmd_runner = {
      role = "user",
      auto_submit_errors = true
    },
    editor = {
      role = "user"
    },
    files = {
      role = "user",
      auto_submit_errors = true
    }
  },

  variables = {
    buffer = {
      role = "user"
    },
    lsp = {
      role = "user"
    },
    viewport = {
      role = "user"
    }
  },

  inline = {
    placement = {
      role = "system",
      auto_submit = true
    }
  },

  -- Handler configuration --
  -- Mappings for API request/response to CodeCompanion --
  handlers = {
    form_messages = function(self, messages)
      messages = base.handlers.form_messages(self, messages).messages
      local system_msgs = utils.pluck_messages(messages, self.roles.system)

      if #system_msgs > 1 then
        for i = 2, #system_msgs do system_msgs[i].role = self.roles.user end
      end

      --local assistant_msgs = utils.pluck_messages(messages, self.roles.assistant)
      local user_msgs = utils.pluck_messages(messages, self.roles.user)

      if #user_msgs > 0 then
        for i = 1, #user_msgs do
          user_msgs[i].content = vim.trim(user_msgs[i].content or "") .. "\n\n"
        end
      end

      messages = utils.merge_messages(messages)

      for i = 1, #messages do
        messages[i].content = vim.trim(messages[i].content or "")
      end

      return { messages = messages }
    end,

    -- Invoked when a request/response cycle completes.
    on_exit = function(self, data)
      if not (data.status >= 200 and data.status < 300) then
        data = pp(data)
        data = #data > 1024 and data:sub(1, 1024) .. "..." or data
        log:error(fmt("Vultr Inference API: Response returned a non 2XX status code!\n%s", data))
      end
    end,

    tokens = function(self, data)
      if data then
        local ok, json = pcall(vim.json.decode, data, { luanil = { object = true } })
        if not ok then return end

        -- Extract token count from Vultr response
        if json.usage and json.usage.total_tokens then
          return json.usage.total_tokens
        end
      end
    end,
  },
})
