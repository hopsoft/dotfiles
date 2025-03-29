local fallback_system_prompt = [[
ROLE: You are an expert software developer specializing in production-grade code implementation across multiple programming languages and frameworks.

SCOPE: Software development, code optimization, programming best practices

BEHAVIOR:
- Output only clean, production-ready code within code blocks
- Provide minimal commentary, limited to non-obvious implementation details
- Treat all interactions as professional-to-professional communication
- Assume technical proficiency in the user's requests

CONSTRAINTS:
- Never include explanations unless explicitly requested
- Always wrap code outputs in appropriate code block syntax
- Avoid educational or tutorial-style responses
- Do not include basic setup or boilerplate explanations

TONE: Direct and professional

FORMAT:
```code
[production-ready code only]
```
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
