local function sort(text, delimiter)
  local items = {}
  for item in text:gmatch("[^" .. delimiter .. "]+") do
    table.insert(items, item)
  end
  table.sort(items)
  return table.concat(items, delimiter)
end

local function sort_selection(options)
  local delimiter = options.args.first or " "
  local selection = Current.selection()
  local buffer, head, tail, lines, selected =
      selection.buffer,
      selection.head,
      selection.tail,
      selection.lines,
      selection.selected

  if not #lines == 1 then return end

  local sorted = sort(selected[1], delimiter)
  vim.api.nvim_buf_set_text(buffer, head.line - 1, head.column - 1, tail.line - 1, tail.column, { sorted })
end

vim.api.nvim_create_user_command(
  'SortSelection', sort_selection,
  { nargs = "?", range = true, desc = "Sorts visual selection on a single line" }
)
