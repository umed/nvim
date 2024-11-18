local o = vim.opt

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- Preview substitutions live, as you type!
o.inccommand = 'split'

o.number = true
o.relativenumber = true
o.mouse = 'a'
o.list = true
o.listchars = {
  tab = '▎ ',
  trail = '·',
  space = '·',
  nbsp = '␣',
}
o.cursorline = true
o.scrolloff = 10
o.splitright = true
o.splitbelow = true
o.tabstop = 4

vim.g.indent_blankline_context_patterns = {
  'declaration',
  'expression',
  'pattern',
  'primary_expression',
  'statement',
  'switch_body',
}

-- vim: ts=2 sts=2 sw=2 et
