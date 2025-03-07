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
  local content

  -- project prompt
  content = load_content(Current.project_root() .. "/.systemprompt")
  if content ~= "" then return content end

  -- cursor prompt
  content = load_content(Current.project_root() .. "/.cursorrules")
  if content ~= "" then return content end

  -- main system prompt
  content = load_content(os.getenv("HOME") .. "/.systemprompt")
  if content ~= "" then return content end

  return fallback_system_prompt
end

return build_system_prompt
