local adapters = require("codecompanion.adapters")
local adapter_schema = require("plugins.codecompanion.adapter_schema")
local build_system_prompt = require("plugins.codecompanion.system_prompt")

require("codecompanion").setup({
  opts = {
    log_level = "WARN",
    system_prompt = build_system_prompt(),
  },

  adapters = {
    opts = {
      show_defaults = false,
    },

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
      local schema = {
        model = {
          default = "claude-3-7-sonnet-latest",
          choices = {
            ["claude-3-7-sonnet-latest"] = { opts = { can_reason = true, can_use_tools = true } },
            ["claude-3-5-sonnet-latest"] = { opts = { can_reason = true, can_use_tools = true } },
          }
        },
      }

      local settings = {
        env = { api_key = "cmd:op read 'op://Private/anthropic/api-keys/main'" },
        schema = adapter_schema.expand(schema, { omit = { "top_k", "top_p" } }),
        temperature = 0.2,
      }

      return adapters.extend("anthropic", settings)
    end,

    -- xAI
    -- RAG Examples:
    -- * @rag search for the latest version of Neovim
    -- * @rag navigate to https://github.com/neovim/neovim/releases
    xai = function()
      local schema = {
        model = {
          default = "grok-beta",
          choices = {
            ["grok-beta"] = { opts = { can_reason = true, can_use_tools = true } },
            ["grok-2"] = { opts = { can_reason = true, can_use_tools = true } },
          }
        },
      }

      local settings = {
        env = { api_key = "cmd:op read 'op://Private/xai/api-keys/main'", },
        schema = adapter_schema.expand(schema, { omit = { "top_k", "top_p" } }),
      }

      return adapters.extend("xai", settings)
    end,

    -- Hopsoft LLC: AnythingLLM Instance
    anythingllm = function()
      local schema = {
        model = {
          default = "software-engineer",
          choices = {
            "marketing",
            "software-engineer",
            "system-prompt-engineer",
            "web-designer",
          }
        }
      }

      local settings = {
        formatted_name = "AnythingLLM",
        env = {
          url = "https://hopsoft.useanything.com/api",
          chat_url = "/v1/openai/chat/completions",
          api_key = "cmd:op read 'op://Private/anythingllm/api-keys/main'",
        },
        headers = { ["Authorization"] = "Bearer ${api_key}" },
        schema = adapter_schema.expand(schema, {
          only = {
            "max_output_tokens",
            "model",
            "temperature",
          },
        }),
      }

      return adapters.extend("openai_compatible", settings)
    end,

    -- Ollama: Local instance with agentic LLMs
    ollama_agent = function()
      local schema = {
        model = {
          default = "llama3.1:8b-instruct-q8_0",
          choices = {
            -- Use-Cases: Suitable for tasks requiring clear instructions like simple coding or documentation.
            -- Pros: Enhanced performance in understanding instructions.
            -- Cons: Less versatile in creative writing or complex reasoning.
            ["llama3.1:8b-instruct-q8_0"] = { opts = { can_reason = true, can_use_tools = true } },

            -- Use-Cases: Ideal for quick, straightforward coding or text instruction tasks.
            -- Pros: Real-time processing capability.
            -- Cons: Limited in deep reasoning or complex context tasks.
            ["mistral:7b-instruct-q8_0"] = { opts = { can_use_tools = true } },
          }
        },
      }

      local settings = {
        formatted_name = "Ollama Agent",
        env = { url = "http://localhost:11434" },
        schema = adapter_schema.expand(schema)
      }

      return adapters.extend("ollama", settings)
    end,

    -- Ollama: Local instance with code LLMs
    ollama_code = function()
      local schema = {
        model = {
          default = "qwen2.5-coder:7b-instruct-q8_0",
          choices = {
            -- Use-Cases: Complex coding problems, advanced code refactoring, or large-scale software development.
            -- Pros: Provides depth in coding tasks due to its size.
            -- Cons: Might require more computational resources.
            ["deepseek-coder-v2:16b-lite-instruct-q5_1"] = { opts = {} },

            -- Use-Cases: Code generation, debugging, and understanding programming languages.
            -- Pros: Tailored for coding, efficient due to 8-bit quantization.
            -- Cons: Might underperform in general language tasks.
            ["qwen2.5-coder:7b-instruct-q8_0"] = { opts = { can_use_tools = true } },
          }
        },
      }

      local settings = {
        formatted_name = "Ollama Code",
        env = { url = "http://localhost:11434" },
        schema = adapter_schema.expand(schema)
      }

      return adapters.extend("ollama", settings)
    end,

    -- Ollama: Local instance with reasoning LLMs
    ollama_reason = function()
      local schema = {
        model = {
          default = "deepseek-r1:14b-qwen-distill-q8_0",
          choices = {
            -- Use-Cases: Useful for tasks involving logical deduction or where a reasoning AI assistant would be beneficial.
            -- Pros: Effective in logical reasoning scenarios.
            -- Cons: Limited model variations in this configuration.
            ["deepseek-r1:14b-qwen-distill-q8_0"] = { opts = { can_reason = true, can_use_tools = true } },
          }
        },
      }

      local settings = {
        formatted_name = "Ollama Reason",
        env = { url = "http://localhost:11434" },
        schema = adapter_schema.expand(schema, { omit = { "top_k", "top_p" } })
      }

      return adapters.extend("ollama", settings)
    end,

    -- Hopsoft LLC: AnythingLLM Instance
    vultr = function()
      local schema = {
        model = {
          default = "qwen2.5-coder-32b-instruct",
          choices = {
            ["deepseek-r1"] = { opts = { can_reason = true } },                   -- Reasoning, math, coding ............................ complex problem-solving, research, development
            ["deepseek-r1-distill-llama-70b"] = { opts = { can_reason = true } }, -- Reasoning math, coding ............................. high-performance applications, resource-limited
            ["deepseek-r1-distill-qwen-32b"] = { opts = { can_reason = true } },  -- Reasoning, math, coding ............................ advanced reasoning tasks, smaller scale
            "hermes-3-llama-3.1-70b-fp8",                                         -- Reasoning, roleplaying, convos ..................... interactive chatbots, creative writing
            "llama-3.1-70b-instruct-fp8",                                         -- Instruction-following .............................. customer support, task automation
            "llama-3.3-70b-instruct-fp8",                                         -- Multilingual instruction-following ................. global applications, language diversity
            "mistral-7b-v0.3",                                                    -- Reasoning, code generation ......................... small-scale coding, efficient reasoning
            "mistral-nemo-instruct-2407",                                         -- Multilingual, large ctx window ..................... global customer support, coding assistance
            "qwen2.5-32b-instruct",                                               -- Instruction-following, long text, structured data .. content generation, data analysis
            "qwen2.5-coder-32b-instruct",                                         -- Coding, reasoning, gneration, fixing ............... programming assistance, code review
            "qwq-32b-awq",                                                        -- Complex reasoning .................................. resource-constrained environments, reasoning
          }
        }
      }

      local settings = {
        formatted_name = "Vultr Inference",
        env = {
          url = "https://api.vultrinference.com",
          chat_url = "/v1/chat/completions",
          api_key = "cmd:op read 'op://Private/vultr/api-keys/VULTR_INFERENCE_API_KEY'",
        },
        headers = { ["Authorization"] = "Bearer ${api_key}" },
        schema = adapter_schema.expand(schema, {
          only = {
            "max_output_tokens",
            "model",
            "temperature",
          },
        }),
      }

      return adapters.extend("openai_compatible", settings)
    end,
  },

  strategies = {
    chat = {
      adapter = "vultr",
      slash_commands = {
        ["buffer"] = { opts = { provider = "fzf_lua" } },  -- default|telescope|mini_pick|fzf_lua|snacks
        ["file"] = { opts = { provider = "fzf_lua" } },    -- default|telescope|mini_pick|fzf_lua|snacks
        ["help"] = { opts = { provider = "fzf_lua" } },    -- telescope|mini_pick|fzf_lua|snacks
        ["symbols"] = { opts = { provider = "fzf_lua" } }, -- default|telescope|mini_pick|fzf_lua|snacks
      },
    },

    inline = {
      adapter = "vultr",
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
