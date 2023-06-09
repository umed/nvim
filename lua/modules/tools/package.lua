local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
})

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  config = function()
    require('gitsigns').setup()
  end,
})

package({
  'mhartington/formatter.nvim',
  event = 'BufWritePre',
  config = function()
    require("formatter").setup()
  end,
})
