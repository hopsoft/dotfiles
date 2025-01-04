local curl = require("plenary.curl")
local log = require("codecompanion.utils.log")
local utils = require("codecompanion.utils.messages")
local known_models = {
  "llama-3.1-70b-instruct-fp8",
  "llama-3.3-70b-instruct",
  "mistral-7b-v0.3",
  "qwen2.5-32b-instruct",
  "qwen2.5-coder-32b-instruct"
}

---@class Vultr.Adapter: CodeCompanion.Adapter
---@field name string The name of the adapter
---@field roles table The mapping of roles in the config to the LLM's defined roles
---@field url string The URL of the LLM to connect to
---@field env? table Environment variables which can be referenced in the parameters
---@field env_replaced? table Replacement of environment variables with their actual values
---@field headers table The headers to pass to the request
---@field parameters table The parameters to pass to the request
---@field raw? table Any additional curl arguments to pass to the request
---@field opts? table Additional options for the adapter
---@field handlers table Functions which link the output from the request to CodeCompanion
---@field handlers.setup? fun()
---@field handlers.form_parameters fun()
---@field handlers.form_messages fun()
---@field handlers.chat_output fun()
---@field handlers.inline_output fun()
---@field handlers.on_exit? fun()
---@field handlers.teardown? fun()
---@field schema table Set of parameters for the LLM that the user can customise in the chat buffer
return {
  name = "vultr",

  roles = {
    llm = "assistant",
    user = "user",
  },

  url = "https://api.vultrinference.com/v1/chat/completions",

  env = {
    api_key = "VULTR_INFERENCE_API_KEY",
  },

  headers = {
    ["Content-Type"] = "application/json",
    Authorization = "Bearer ${api_key}",
  },

  parameters = {
    stream = true,
  },

  raw = {
    "--no-buffer",
    "--silent",
  },

  opts = {
    stream = true,
  },

  -- TODO (review function args in other adapters)
  handlers = {
    setup = function(self)
      log:debug("Setting up Vultr Inference API adapter")
      self.parameters.stream = self.opts and self.opts.stream
      return true
    end,

    -- Set the parameters
    form_parameters = function(self, params, messages)
      log:debug("Setting parameters", params, messages)
      return params
    end,

    -- Prepare the parameters from the chat buffer for the API request
    --
    -- Example Request Payload:
    --
    --   {
    --     "model": "string",
    --     "messages": [
    --       {
    --         "role": "system",
    --         "content": "string"
    --       }
    --     ],
    --     "stream": true,
    --     "max_tokens": 512,
    --     "n": 1,
    --     "seed": 0,
    --     "temperature": 1,
    --     "top_p": 1,
    --     "frequency_penalty": 0,
    --     "presence_penalty": 0,
    --     "stop": [
    --       "string"
    --     ],
    --     "logprobs": true,
    --     "top_logprobs": 20
    --   }
    form_messages = function(self, messages)
      log:debug("Preparing messages for Vultr API request", messages)

      messages = vim
          .iter(messages)
          :map(function(m)
            local model = self.schema.model.default
            if type(model) == "function" then
              model = model()
            end

            return {
              role = m.role,
              content = m.content,
            }
          end)
          :totable()

      -- Ensure a single system message for Vultr API
      local system_messages = utils.pluck_messages(messages, "system")
      utils.pop_messages(messages, "system")
      messages = vim.list_extend(utils.merge_messages(system_messages), utils.merge_messages(messages))

      log:debug("Messages prepared for Vultr API request", messages)
      return messages
    end,

    -- Prepare the API response data for insertion into the chat buffer
    --
    -- Example Response Payload:
    --   {
    --     "id": "string",
    --     "created": 0,
    --     "model": "string",
    --     "choices": [
    --       {
    --         "index": 0,
    --         "message": {
    --           "role": "system",
    --           "content": "string",
    --           "tool_calls": [
    --             {
    --               "id": "string",
    --               "type": "string",
    --               "function": {
    --                 "name": "string",
    --                 "arguments": "string"
    --               }
    --             }
    --           ]
    --         },
    --         "logprobs": {
    --           "content": [
    --             {
    --               "token": "string",
    --               "logprob": 0,
    --               "bytes": [
    --                 0
    --               ],
    --               "top_logprobs": [
    --                 {
    --                   "token": "string",
    --                   "logprob": 0,
    --                   "bytes": [
    --                     0
    --                   ]
    --                 }
    --               ]
    --             }
    --           ]
    --         },
    --         "finish_reason": "string"
    --       }
    --     ],
    --     "usage": {
    --       "completion_tokens": 0,
    --       "prompt_tokens": 0,
    --       "total_tokens": 0
    --     }
    --   }
    chat_output = function(self, data)
      log:debug("Processing Vultr API response for chat output.", data)
      local ok, json = pcall(vim.json.decode, data, { luanil = { object = true } })

      if not ok or type(json) ~= "table" or type(json.choices) ~= "table" or #json.choices == 0 then
        log:error("Invalid Vultr API response!", data)
        return {
          role = 'assistant',
          content = string.format("Invalid Vultr API response! %s", vim.inspect(data))
        }
      end

      local choice = json.choices[1]
      local message = choice.message or {}

      local output = {
        role = message.role or "assistant",
        content = message.content or
            string.format("Vultr API response is missing message content! %s", vim.inspect(choice))
      }

      log:debug("Processed Vultr API response for chat output.", output)
      return output
    end,

    -- Prepare the API response data for inlining into the current buffer
    -- See example response payload above.
    inline_output = function(self, data, context)
      log:debug("Processing Vultr API response for inline output.", data)
      local ok, json = pcall(vim.json.decode, data, { luanil = { object = true } })

      if not ok or type(json) ~= "table" or type(json.choices) ~= "table" or #json.choices == 0 then
        log:error("Invalid Vultr API response!", data)
        return {
          role = 'assistant',
          content = string.format("Invalid Vultr API response! %s", vim.inspect(data))
        }
      end

      local choice = json.choices[1]
      local message = choice.message or {}

      return message.content or
          string.format("Vultr API response is missing message content! %s", vim.inspect(choice))
    end,

    -- Returns the total number of tokens used in the request (prompt + completion).
    tokens = function(self, data)
      log:debug("Processing Vultr API response for token usage output.", data)
      local ok, json = pcall(vim.json.decode, data, { luanil = { object = true } })

      if not ok or type(json) ~= "table" or type(json.usage) ~= "table" then
        log:error("Invalid Vultr API response!", data)
        return 0
      end

      local tokens = json.usage.total_tokens

      log:debug("Processed Vultr API response for token usage output.", tokens)
      return tokens or 0
    end,

    -- Fetches available models from the Vultr API
    --
    -- Example Response Payload:
    --    {
    --      "object": "list",
    --      "data": [
    --        {
    --          "id": "llama-3.1-70b-instruct-fp8",
    --          "created": 1733947142,
    --          "object": "model",
    --          "owned_by": "system",
    --          "features": [
    --            "TextGeneration"
    --          ]
    --        },
    --        {
    --          "id": "llama-3.3-70b-instruct",
    --          "created": 1734036736,
    --          "object": "model",
    --          "owned_by": "system",
    --          "features": [
    --            "TextGeneration"
    --          ]
    --        },
    --        {
    --          "id": "mistral-7b-v0.3",
    --          "created": 1733959912,
    --          "object": "model",
    --          "owned_by": "system",
    --          "features": [
    --            "TextGeneration"
    --          ]
    --        },
    --        {
    --          "id": "qwen2.5-32b-instruct",
    --          "created": 1733960215,
    --          "object": "model",
    --          "owned_by": "system",
    --          "features": [
    --            "TextGeneration"
    --          ]
    --        },
    --        {
    --          "id": "qwen2.5-coder-32b-instruct",
    --          "created": 1733960354,
    --          "object": "model",
    --          "owned_by": "system",
    --          "features": [
    --            "TextGeneration"
    --          ]
    --        }
    --      ]
    --    }
    models = function(self)
      log:debug("Fetching Vultr models")
      local adapter = require("codecompanion.adapters").resolve(self)
      adapter:get_env_vars()

      local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. adapter.env_replaced.api_key,
      }

      local response = curl.get("https://api.vultrinference.com/v1/models", {
        sync = true,
        headers = headers,
      })

      local json = vim.json.decode(response.body, { luanil = { object = true } })

      if type(json) ~= "table" or type(json.data) ~= "table" then
        log:error("Invalid Vultr API response!", json)
      end

      -- todo fix map
      local models = {}
      for _, item in ipairs(json.data) do
        table.insert(models, item.id)
      end

      return models
    end,

    -- Invoked when a request/response cycle completes.
    on_exit = function(self, data)
      log:debug("Exiting Vultr API request/response cycle.", data)
      if not (data.status >= 200 and data.status < 300) then
        log:error("Vultr API request/response returned a non 2XX status code!", data)
      end
    end,

    schema = {
      -- NOTE: For RAG chat (revisit later)
      -- collection = {
      --   order = 1,
      --   mapping = "parameters",
      --   desc = "The vector store collection to search for relevant context.",
      --   type = "string",
      -- },

      model = {
        order = 1,
        mapping = "parameters",
        desc = "The model that will be inferred for chat completion.",
        type = "enum",

        default = function(self)
          local ok, models = pcall(self.models, self)
          return (not ok and known_models or models)[1]
        end,

        choices = function(self)
          local ok, models = pcall(self.models, self)
          return not ok and known_models or models
        end,
      },

      stream = {
        order = 2,
        mapping = "parameters",
        desc = "Indicates whether the response should be streamed.",
        optional = true,
        type = "boolean",
      },

      max_tokens = {
        order = 3,
        mapping = "parameters",
        desc = "The maximum number of tokens to generate for the chat completion.",
        default = 512,
        optional = true,
        type = "integer",
        validate = function(n)
          return n > 0, "Must be greater than 0"
        end,
      },

      n = {
        order = 4,
        mapping = "parameters",
        desc = "The number of chat completion choices to generate for each input message.",
        default = 1,
        optional = true,
        type = "integer",
        validate = function(n)
          return n > 0, "Must be greater than 0"
        end,
      },

      seed = {
        order = 5,
        mapping = "parameters",
        desc =
        "If you would like a different response from the same message, changing the seed will change the response. A null value generates a random seed.",
        optional = true,
        type = "integer",
        validate = function(n)
          return n > 0, "Must be greater than 0"
        end,
      },

      temperature = {
        order = 6,
        mapping = "parameters",
        desc =
        "A value between 0.0 and 2.0 that controls the randomness of the model's output. When set closer to 1, such as 0.8, the outcome is more unpredictable and creative. Values nearing 0, like 0.2, produce more predictable and less creative results. Setting temperature to zero is equivalent to setting a seed, enabling deterministic testing.",
        default = 1,
        optional = true,
        type = "number",
        validate = function(n)
          return n >= 0 and n <= 2, "Must be between 0 and 2"
        end,
      },

      top_p = {
        order = 7,
        mapping = "parameters",
        desc =
        "A value between 0.0 and 1.0 that controls the probability of the model generating a particular token. A higher value will result in more diverse outputs, while a lower value will result in more repetitive outputs.",
        default = 1,
        optional = true,
        type = "number",
        validate = function(n)
          return n >= 0 and n <= 1, "Must be between 0 and 1"
        end,
      },

      frequency_penalty = {
        desc = "A value between -2.0 and 2.0 that controls how much the model penalizes generating repetitive responses.",
        order = 8,
        default = 0,
        mapping = "parameters",
        optional = true,
        type = "number",
        validate = function(n)
          return n >= -2 and n <= 2, "Must be between -2 and 2"
        end,
      },

      presence_penalty = {
        desc =
        "A value between -2.0 and 2.0 that controls how much the model penalizes generating responses that contain certain words or phrases.",
        order = 9,
        default = 0,
        mapping = "parameters",
        optional = true,
        type = "number",
        validate = function(n)
          return n >= -2 and n <= 2, "Must be between -2 and 2"
        end,
      },

      stop = {
        order = 10,
        mapping = "parameters",
        desc = "A list of strings that the model will stop generating text if it encounters any of them.",
        optional = true,
        type = "list",
        subtype = {
          type = "string",
        }
      },

      logprobs = {
        order = 11,
        mapping = "parameters",
        desc =
        "Whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of each output token returned in the content of message.",
        optional = true,
        type = "boolean",
      },

      top_logprobs = {
        order = 12,
        mapping = "parameters",
        desc =
        "An integer between 0 and 20 specifying the number of most likely tokens to return at each token position, each with an associated log probability. logprobs must be set to true if this parameter is used.",
        optional = true,
        type = "integer",
        validate = function(n)
          return n >= 0 and n <= 20, "Must be between 0 and 20"
        end,
      },
    }
  }
}
