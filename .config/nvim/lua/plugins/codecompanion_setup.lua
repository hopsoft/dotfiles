local adapters = require("codecompanion.adapters")

local fallback_system_prompt = [[
You are a professional coder, skilled in multiple programming languages and frameworks.
You help the user with their coding projects, provide guidance, and share best practices.

The user is also a professional.
When the user ask you to write code, you only output the code without any explanation needed.
Only add explanation for non-obvious things about the code.

Always output production ready quality code, not code examples.

IMPORTANT: Only output the code inside a code block. No explanation needed unless the user ask you to explain/answer questions.
]]

local load_content = function(filepath)
  local file = io.open(filepath, "r")
  if not file then return "" end
  local content = file:read("*all")
  file:close()
  return content
end

local build_system_prompt = function()
  local result = {}
  local content
  local divider = "\n\n// --- divider ---\n\n"

  -- main system prompt
  content = load_content(os.getenv("HOME") .. "/.systemprompt")
  if content ~= "" then result[#result + 1] = content end

  -- project system prompt
  content = load_content(Current.project_root() .. "/.systemprompt")
  if content ~= "" then result[#result + 1] = divider .. content end

  -- cursor system prompt
  if content ~= "" then
    content = load_content(Current.project_root() .. "/.cursorrules")
    if content ~= "" and result[#result] > 0 then
      result[#result + 1] = divider .. content
    elseif content ~= "" then
      result[#result + 1] = content
    end
  end

  -- fallback system prompt
  if #result == 0 then result[#result + 1] = fallback_system_prompt end

  return table.concat(result, "\n")
end

local adapter_defaults = {
  env = {
    url = "http://localhost:11434",
  },

  schema = {
    num_ctx = { default = 4096, },       -- max tokens the language model can consider at once (default: 2048)
    num_predict = { default = 2048, },   -- max number of tokens to predict when generating text. (default: -1 = infinite)
    repeat_penalty = { default = 1.5, }, -- how strongly to penalize repetitions, higher values penalize repetitions more strongly (default: 1.1)
    temperature = { default = 0.1, },    -- higher values make the output more random (default: 0.7)
    top_k = { default = 20 },            -- reduces the probability of generating nonsense
    top_p = { default = 0.1, },          -- higher values lead to more diverse text (default: 0.9)
  },
}

local build_adapter = function(base, opts)
  return adapters.extend(base, vim.tbl_deep_extend("force", adapter_defaults, opts))
end

require("codecompanion").setup({
  adapters = {
    deepseek_coder = build_adapter("ollama", {
      name = "Ollama: Deepseek Coder V2 16b",
      schema = { model = { default = "deepseek-coder-v2:16b" } },
    }),

    deepseek_r1 = build_adapter("ollama", {
      name = "Ollama: Deepseek R1 14b",
      schema = { model = { default = "deepseek-r1:14b" } },
    }),

    mistral = build_adapter("ollama", {
      name = "Ollama: Mistral v0.3 7b", -- Vutr Inference
      schema = { model = { default = "mistral:7b" } },
    }),

    qwen_coder = build_adapter("ollama", {
      name = "Ollama: Qwen Coder 2.5 14b", -- Vutr Inference
      schema = { model = { default = "qwen2.5-coder:14b" } },
    }),
  },

  display = {
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

    code_actions = {
      provider = "telescope", -- default|telescope|mini_pick
    },

    context = {
      provider = "telescope", -- default|telescope|mini_pick
    },

    inline = {
      layout = "vertical", -- vertical|horizontal|buffer (default: vertical)
    },

    prompts = {
      provider = "telescope", -- default|telescope|mini_pick
    },
  },

  opts = {
    system_prompt = build_system_prompt(),
  },

  strategies = {
    chat = {
      adapter = "deepseek_r1",
      slash_commands = {
        ["buffer"] = { opts = { provider = "fzf_lua" } },
        ["file"] = { opts = { provider = "fzf_lua" } },
        ["help"] = { opts = { provider = "fzf_lua" } },
        ["symbols"] = { opts = { provider = "fzf_lua" } },
      },
    },

    inline = {
      adapter = "qwen_coder"
    },
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
