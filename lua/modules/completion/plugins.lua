local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

enabled_lsp_filetypes = {
  'elixir',
  'lua',
  'rust',
  'c',
  'cpp',
}

plugin({
  'hrsh7th/nvim-cmp',
  event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
  },
})

plugin({
  'neovim/nvim-lspconfig',
  ft = enabled_lsp_filetypes,
  config = conf.nvim_lsp,
  after = 'cmp-nvim-lsp'
})

plugin({
  'williamboman/mason.nvim',
})

plugin({
  'williamboman/mason-lspconfig.nvim',
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.lua_snip })

plugin({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })
