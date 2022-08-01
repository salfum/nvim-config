local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

enabled_lsp_filetypes = {
  'lua',
  'rust',
  'c',
  'cpp',
}

plugin({
  'neovim/nvim-lspconfig',
  ft = enabled_lsp_filetypes,
  config = conf.nvim_lsp,
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.lua_snip })

plugin({
  'hrsh7th/nvim-cmp',
  after = 'LuaSnip',
  event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  },
})

plugin({'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })

plugin({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })
