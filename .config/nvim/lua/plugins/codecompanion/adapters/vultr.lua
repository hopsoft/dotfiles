local adapters = require("codecompanion.adapters")
local base = require("codecompanion.adapters.openai_compatible")
local utils = require("codecompanion.utils.messages")
local log = require("codecompanion.utils.log")
local fmt = string.format
local pp = vim.inspect

return adapters.extend(base, {
  name = "vultr",
  url = "https://api.vultrinference.com/v1/chat/completions",

  env = {
    api_key = "VULTR_INFERENCE_API_KEY",
  },

  roles = {
    system = "system",
    user = "user",
    llm = "assistant",
  },

  parameters = {
    model = "qwen2.5-coder-32b-instruct",
    temperature = 1,
    top_p = 1,
    stream = true,
    max_tokens = 512,
  },

  features = {
    text = true,
    tokens = true,
    vision = false,
  },

  opts = {
    stream = true,
  },

  headers = {
    ["Content-Type"] = "application/json",
    Authorization = "Bearer ${api_key}",
  },

  handlers = {
    form_messages = function(self, messages)
      -- Filter out any empty messages (Vultr rejects empty messages)
      messages = vim.tbl_filter(function(msg)
        local content = type(msg.content) == "string" and vim.trim(msg.content) or ""
        return content ~= ""
      end, messages)

      -- Merge consecutive messages of the same role
      messages = utils.merge_messages(messages)

      -- Ensure the last message is a user message
      local last_msg = messages[#messages]
      if last_msg.role ~= self.roles.user then
        -- Raising blocks the plugin from making the request
        error(
          "Your prompt appears to be incomplete. Be sure to include context when using commands, tools, or variables.\n" ..
          "SEE: https://github.com/olimorris/codecompanion.nvim?tab=readme-ov-file#rocket-quickstart"
        )
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
  },

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
  }
})
