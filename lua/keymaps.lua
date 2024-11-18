local map = vim.keymap.set

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- add yours here
vim.api.nvim_create_user_command('CopyFullPath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopyRelPath', function()
  local path = vim.fn.fnamemodify(vim.fn.expand '%', ':.')
  vim.api.nvim_call_function('setreg', { '+', path })
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')
map('i', 'JK', '<ESC>')
map('n', '<leader>fs', '<CMD>Telescope grep_string<CR>', { desc = 'search for word under cursor' })
map('x', '<leader>fs', '<CMD>Telescope grep_string<CR>', { desc = 'search for selected text' })
map('n', 'cp', '<CMD>CopyRelPath<CR>', { desc = 'copy relative file path' })
map('n', 'cfp', '<CMD>CopyFullPath<CR>', { desc = 'copy full file path' })

map('n', '<leader>th', ':Telescope themes<CR>', { noremap = true, silent = true, desc = 'Theme Switcher' })

-- vim: ts=2 sts=2 sw=2 et
