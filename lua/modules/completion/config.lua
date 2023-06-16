local config = {}

function _attach(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  client.server_capabilities.semanticTokensProvider = nil
  local orignal = vim.notify
  local mynotify = function(msg, level, opts)
    if msg == 'No code actions available' or msg:find('overly') then
      return
    end
    orignal(msg, level, opts)
  end

  vim.notify = mynotify
end


-- config server in this function
function config.nvim_lsp()
  lspconfig = require('lspconfig')

  lspconfig.clangd.setup({
    on_attach = _attach,
  })
end

function config.nvim_cmp()
  local cmp = require('cmp')

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  local types = require('luasnip.util.types')
  ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
  })
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.lspsaga()
  require('lspsaga').setup({})
end
return config
