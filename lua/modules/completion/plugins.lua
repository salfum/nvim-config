local plugin = require('core.pack').register_plugin

enabled_lsp_filetypes = {
  'elixir',
  'lua',
  'rust',
}

plugin({
  'neovim/nvim-lspconfig',
  ft = enabled_lsp_filetypes,
  config = function()
    require('modules.completion.configs.nvim-lspconfig')
  end,
  requires = {
    -- LSP support
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'BufReadPre',
      config = function()
        require('modules.completion.configs.nvim-cmp')
      end,
      after = 'nvim-lspconfig',
    },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },

    -- Snippets
    {
      'L3MON4D3/LuaSnip',
      event = 'InsertEnter',
      config = function()
        require('modules.completion.configs.LuaSnip')
      end,
    },
    { 'rafamadriz/friendly-snippets' },
  },
})

plugin({
  'jose-elias-alvarez/null-ls.nvim',
  commit = '753ad51790a966b42997ac935e26573fb6d5864a',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('modules.completion.configs.null-ls')
  end,
})

plugin({
  'windwp/nvim-autopairs',
  commit = '0a18e10a0c3fde190437567e40557dcdbbc89ea1',
  event = 'InsertEnter',
  config = function()
    require('modules.completion.configs.nvim-autopairs')
  end,
})
