local adapters = require("codecompanion.adapters")
local build_llm_settings = require("plugins.codecompanion.llm_settings")
local build_system_prompt = require("plugins.codecompanion.system_prompt")

require("codecompanion").setup({
  opts = {
    log_level = "TRACE",
    system_prompt = build_system_prompt(),
  },

  adapters = {
    -- Hopsoft LLC: AnythingLLM Instance
    anythingllm = adapters.extend("openai_compatible", {
      name = "AnythingLLM (hopsoft)",
      env = {
        url = "https://hopsoft.useanything.com/api",
        chat_url = "/v1/openai/chat/completions",
        api_key = "cmd:op read 'op://Private/AnythingLLM/API KEYS/main'",
      },
      headers = { ["Authorization"] = "Bearer ${api_key}" },
      schema = build_llm_settings({
        model = {
          default = "software-engineer",
          choices = function(self)
            return {
              "marketing",
              "software-engineer",
              "system-prompt-engineer",
              "web-designer",
            }
          end
        },
      }),
    }),

    -- Ollama: Local Instance
    ollama_local = adapters.extend("ollama", {
      name = "Ollama (local)",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "deepseek-r1:14b",
          choices = function(self)
            return {
              "deepseek-coder-v2:16b",
              "deepseek-r1:14b",
              "llama3.1:8b",
              "mistral:7b",
              "qwen2.5-coder:14b",
            }
          end
        },
      }),
    }),

    -- Ollama: Local Instance (code only)
    ollama_local_code = adapters.extend("ollama", {
      name = "Ollama Code (local)",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "deepseek-coder-v2:16b",
          choices = function(self)
            return {
              "deepseek-coder-v2:16b",
              "qwen2.5-coder:14b",
            }
          end
        },
      }),
    }),

    -- Ollama: Local Instance with tool + function support
    ollama_local_tools = adapters.extend("ollama", {
      name = "Ollama Tools (local)",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "llama3.1:8b",
          choices = function(self)
            return {
              "llama3.1:8b",
              "mistral:7b",
            }
          end
        },
      }),
    }),
  },

  strategies = {
    chat = {
      adapter = "anythingllm",
      slash_commands = {
        ["buffer"] = { opts = { provider = "fzf_lua" } },  -- default|telescope|mini_pick|fzf_lua|snacks
        ["file"] = { opts = { provider = "fzf_lua" } },    -- default|telescope|mini_pick|fzf_lua|snacks
        ["help"] = { opts = { provider = "fzf_lua" } },    -- telescope|mini_pick|fzf_lua|snacks
        ["symbols"] = { opts = { provider = "fzf_lua" } }, -- default|telescope|mini_pick|fzf_lua|snacks
      },
    },

    inline = {
      adapter = "ollama_local_code",
    },

    agent = {
      adapter = "ollama_local_tools",
    },
  },

  display = {
    confirm_before_accepting = true,
    show_diff = true,
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt: ",                  -- Prompt used for interactive LLM calls
      provider = "telescope",               -- default|telescope|mini_pick
      opts = {
        show_default_actions = true,        -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },

    chat = {
      intro_message = "CodeCompanion ✨! (press `?` for options)",
      show_header_separator = false, -- Show header separators in chat buffer? Set false if using a formatting plugin (default: false)
      separator = "─", -- Separator between different messages in chat buffer (default: "─")
      show_references = true, -- Show references from `/` commands and `#` variables in chat buffer? (default: true)
      show_settings = false, -- Show LLM settings at top of chat buffer? (default: false)
      show_token_count = true, -- Show token count for responses? (default: true)
      start_in_insert_mode = false, -- Open chat buffer in insert mode? (default: false)
    },

    code_actions = { provider = "telescope" }, -- default|telescope|mini_pick
    context = { provider = "telescope" },      -- default|telescope|mini_pick
    inline = { layout = "vertical" },          -- vertical|horizontal|buffer (default: vertical)
    prompts = { provider = "telescope" },      -- default|telescope|mini_pick
  },
})

--TODO: Revsit the Vultr adapter
--local CodeCompanionAdapter = require("codecompanion.adapters")
--local Vultr = require("plugins.codecompanion.adapters.vultr")

--require("codecompanion").setup({
--opts = {
--log_level = "TRACE",
--},

--adapters = {
--vultr = function()
--return CodeCompanionAdapter.extend(Vultr, {
--schema = {
--model = {
--default = "llama-3.3-70b-instruct"
--}
--}
--})
--end,

--vultr_coder = function()
--return CodeCompanionAdapter.extend(Vultr, {
--schema = {
--model = {
--default = "qwen2.5-coder-32b-instruct"
--}
--}
--})
--end
--},

--strategies = {
--chat = {
--adapter = "vultr_coder",
--},

--inline = {
--adapter = "vultr_coder",
--}
--}
--})
