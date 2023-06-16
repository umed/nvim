local keymap = require('core.keymap')
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
  -- remove trailing white space
  -- { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
})

-- buffers
nmap({
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>bc', cmd('bdelete'), opts(noremap, silent) },
  { 'bn', cmd('bn'), opts(noremap) },
  { 'bp', cmd('bp'), opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

-- usage of plugins
nmap({
  -- plugin manager: Lazy.nvim
  { '<Leader>pu', cmd('Lazy update'), opts(noremap, silent) },
  { '<Leader>pi', cmd('Lazy install'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },

  -- Telescope
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<C-p>', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
  { '<Leader>fb', cmd('Telescope file_browser'), opts(noremap, silent) },
})

-- completion
nmap({
  { 'gd', cmd('Lspsaga goto_definition'), opts(noremap) },
  { 'gr', cmd('Lspsaga rename'), opts(noremap) },
  { 'gca', cmd('Lspsaga rename'), opts(noremap) },
})
