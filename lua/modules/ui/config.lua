local config = {}

function config.zephyr()
  vim.cmd('colorscheme zephyr')
end

function config.dashboard()
  local db = require('dashboard')
  db.setup({
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      shortcut = {
        { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
  })
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
      separator_style = 'slant',
    },
  })
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '│',
    use_treesitter_scope = true,
    show_first_indent_level = true,
    show_current_context = false,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'log',
      'TelescopePrompt',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    view = {
      adaptive_size = false,
      side = 'right',
      width = 30,
      preserve_window_proportions = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  })
end

return config
