local leftTree = {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    side = 'right',
    width = 40,
    preserve_window_proportions = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = '󰈚',
        folder = {
          default = '',
          empty = '',
          empty_open = '',
          open = '',
          symlink = '',
        },
        git = { unmerged = '' },
      },
    },
  },
}

-- local gwidth = vim.api.nvim_list_uis()[1].width
-- local gheight = vim.api.nvim_list_uis()[1].height
-- local width = 100
-- local height = 20
--
-- local floatingTree = {
--   view = {
--     width = width,
--     -- height = height,
--     float = {
--       enable = true,
--       open_win_config = {
--         relative = 'editor',
--         width = width,
--         height = height,
--         row = (gheight - height) * 0.4,
--         col = (gwidth - width) * 0.5,
--       },
--     },
--   },
--   update_focused_file = { enable = true },
-- }

return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  keys = {
    { '\\', '<CMD>NvimTreeToggle<CR>', desc = 'nvim-tree reveal', silent = true },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = leftTree,
}
