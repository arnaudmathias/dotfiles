local builtin = require('telescope.builtin')

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- Mappings
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gr', builtin.grep_string, {})
vim.keymap.set('v', '<leader>gr', function()
  local text = vim.getVisualSelection()
  builtin.live_grep({ default_text = text })
end)

-- Git Pickers
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fgbc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>fgst', builtin.git_stash, {})

