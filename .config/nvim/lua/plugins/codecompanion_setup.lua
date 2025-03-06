local adapters = require("codecompanion.adapters")
local build_llm_settings = require("plugins.codecompanion.llm_settings")
local build_system_prompt = require("plugins.codecompanion.system_prompt")

require("codecompanion").setup({
  opts = {
    log_level = "TRACE",
    system_prompt = build_system_prompt(),
  },

  adapters = {
    non_llms = {
      jina = function()
        return require("codecompanion.adapters").extend("jina", {
          env = {
            api_key = "cmd:op read 'op://Private/jina-ai/api-keys/main'",
          },
          headers = {
            ["Authorization"] = "Bearer ${api_key}",
          },
        })
      end,
    },

    -- Anthropic
    -- RAG Examples:
    -- * @rag search for the latest version of Neovim
    -- * @rag navigate to https://github.com/neovim/neovim/releases
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = {
          api_key = "cmd:op read 'op://Private/anthropic/api-keys/main'",
        },
        schema = build_llm_settings({
          model = {
            default = "claude-3-7-sonnet-latest",
            choices = {
              "claude-3-7-sonnet-latest",
              "claude-3-5-sonnet-latest",
              "claude-3-5-haiku-latest",
            }
          },
        }),
      })
    end,

    -- X AI
    -- RAG Examples:
    -- * @rag search for the latest version of Neovim
    -- * @rag navigate to https://github.com/neovim/neovim/releases
    xai = function()
      return require("codecompanion.adapters").extend("xai", {
        env = {
          api_key = "cmd:op read 'op://Private/xai/api-keys/main'",
        },
        schema = build_llm_settings({
          model = {
            default = "grok-beta",
            choices = {
              "grok-beta",
              "grok-2",
            }
          },
        }),
      })
    end,

    -- Hopsoft LLC: AnythingLLM Instance
    anythingllm = adapters.extend("openai_compatible", {
      name = "AnythingLLM (hopsoft)",
      env = {
        url = "https://hopsoft.useanything.com/api",
        chat_url = "/v1/openai/chat/completions",
        api_key = "cmd:op read 'op://Private/anythingllm/api-keys/main'",
      },
      headers = { ["Authorization"] = "Bearer ${api_key}" },
      schema = build_llm_settings({
        model = {
          default = "software-engineer",
          choices = {
            "marketing",
            "software-engineer",
            "system-prompt-engineer",
            "web-designer",
          }
        },
      }),
    }),

    -- Ollama: Local instance with agentic LLMs
    ollama_agent = adapters.extend("ollama", {
      name = "OllamaAgent",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "mistral:7b-instruct-q8_0",
          choices = {
            -- Use-Cases: Suitable for tasks requiring clear instructions like simple coding or documentation.
            -- Pros: Enhanced performance in understanding instructions.
            -- Cons: Less versatile in creative writing or complex reasoning.
            -- Tools: true
            "llama3.1:8b-instruct-q8_0",

            -- Use-Cases: Ideal for quick, straightforward coding or text instruction tasks.
            -- Pros: Real-time processing capability.
            -- Cons: Limited in deep reasoning or complex context tasks.
            -- Tools: true
            "mistral:7b-instruct-q8_0",
          }
        },
      }),
    }),

    -- Ollama: Local instance with code LLMs
    ollama_code = adapters.extend("ollama", {
      name = "OllamaCode",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "qwen2.5-coder:7b-instruct-q8_0",
          choices = {
            -- Use-Cases: Complex coding problems, advanced code refactoring, or large-scale software development.
            -- Pros: Provides depth in coding tasks due to its size.
            -- Cons: Might require more computational resources.
            -- Tools: false
            "deepseek-coder-v2:16b-lite-instruct-q5_1",

            -- Use-Cases: Code generation, debugging, and understanding programming languages.
            -- Pros: Tailored for coding, efficient due to 8-bit quantization.
            -- Cons: Might underperform in general language tasks.
            -- Tools: true
            "qwen2.5-coder:7b-instruct-q8_0",
          }
        },
      }),
    }),

    -- Ollama: Local instance with reasoning LLMs
    ollama_reason = adapters.extend("ollama", {
      name = "OllamaReason",
      env = { url = "http://localhost:11434" },
      schema = build_llm_settings({
        model = {
          default = "deepseek-r1:14b-qwen-distill-q8_0",
          choices = {
            -- Use-Cases: Useful for tasks involving logical deduction or where a reasoning AI assistant would be beneficial.
            -- Pros: Effective in logical reasoning scenarios.
            -- Cons: Limited model variations in this configuration.
            -- Tools: true
            "deepseek-r1:14b-qwen-distill-q8_0",
          }
        },
      }),
    }),
  },

  strategies = {
    chat = {
      adapter = "ollama_agent",
      slash_commands = {
        ["buffer"] = { opts = { provider = "fzf_lua" } },  -- default|telescope|mini_pick|fzf_lua|snacks
        ["file"] = { opts = { provider = "fzf_lua" } },    -- default|telescope|mini_pick|fzf_lua|snacks
        ["help"] = { opts = { provider = "fzf_lua" } },    -- telescope|mini_pick|fzf_lua|snacks
        ["symbols"] = { opts = { provider = "fzf_lua" } }, -- default|telescope|mini_pick|fzf_lua|snacks
      },
    },

    inline = {
      adapter = "ollama_code",
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
