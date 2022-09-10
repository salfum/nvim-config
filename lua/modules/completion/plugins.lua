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
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require('modules.completion.configs.mason-lspconfig')
      end,
    },

    -- Autocompletion
    { 'hrsh7th/cmp-nvim-lsp', ft = enabled_lsp_filetypes },
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
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', ft = { 'lua' } },

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
  'ray-x/lsp_signature.nvim',
  commit = 'e65a63858771db3f086c8d904ff5f80705fd962b',
  ft = enabled_lsp_filetypes,
  config = function()
    require('modules.completion.configs.lsp_signature')
  end,
})

plugin({
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  commit = 'dbfd8e96ec2696e1ceedcd23fd70e842256e3dea',
  config = function()
    require('modules.completion.configs.lsp_lines')
  end,
})

plugin({
  'jose-elias-alvarez/null-ls.nvim',
  commit = '753ad51790a966b42997ac935e26573fb6d5864a',
  event = 'BufReadPost',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('modules.completion.configs.null-ls')
  end,
})
