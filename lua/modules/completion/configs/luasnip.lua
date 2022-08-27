local luasnip = require('luasnip')
local types = require('luasnip.util.types')

luasnip.config.set_config({
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

require('luasnip.loaders.from_lua').lazy_load({
  paths = vim.fn.stdpath('config') .. '/snippets',
})

require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { './snippets/' },
})
