require('chatgpt').setup({
  openai_params = {
    max_tokens = 600,
    temperature = 0.3
  },

  chat = {
    sessions_window = {
      win_options = {
        winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
      }
    }
  },

  popup_window = {
    win_options = {
      winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
    }
  },

  popup_input = {
    submit = '<C-s>',
    win_options = {
      winhighlight = 'Normal:DiagnosticOk,FloatingBorder:FloatBorder'
    }
  },

  settings_window = {
    win_options = {
      winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
    }
  },

  actions_paths = {
    os.getenv('DOTDIR') .. '/openai/chat/actions/fun.json',
    os.getenv('DOTDIR') .. '/openai/chat/actions/rails.json',
    os.getenv('DOTDIR') .. '/openai/chat/actions/ruby.json'
  },

  predefined_chat_gpt_prompts = 'https://raw.githubusercontent.com/hopsoft/dotfiles/main/openai/chat/prompts.csv',
})
