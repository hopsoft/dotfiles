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
  local result

  -- project prompt
  result = load_content(Current.project_root() .. "/.systemprompt")
  if content ~= "" then return result end

  -- cursor prompt
  result = load_content(Current.project_root() .. "/.cursorrules")
  if content ~= "" then return result end

  -- main system prompt
  result = load_content(os.getenv("HOME") .. "/.systemprompt")
  if result ~= "" then return result end

  return fallback_system_prompt
end

return build_system_prompt
