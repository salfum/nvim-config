local plugin = require('core.pack').register_plugin

enabled_lsp_filetypes = {
  'elixir',
  'lua',
  'rust',
}

plugin({
  'neovim/nvim-lspconfig',
  ft = enabled_lsp_filetypes,
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.nvim-lspconfig')
  end,
  requires = {
    {
      'williamboman/mason.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require('modules.completion.configs.mason')
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      after = 'mason.nvim',
      config = function()
        require('modules.completion.configs.mason-lspconfig')
      end,
    },
  },
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'BufReadPost',
  after = 'nvim-lspconfig',
  config = function()
    require('modules.completion.configs.nvim-cmp')
  end,
  requires = {
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', ft = enabled_lsp_filetypes },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', ft = { 'lua' } },
  },
})

plugin({
  'L3MON4D3/LuaSnip',
  after = 'nvim-cmp',
  event = 'InsertEnter',
  config = function()
    require('modules.completion.configs.LuaSnip')
  end,
})
plugin({ 'rafamadriz/friendly-snippets', event = 'BufReadPost' })

plugin({
  'ray-x/lsp_signature.nvim',
  commit = 'e65a63858771db3f086c8d904ff5f80705fd962b',
  ft = enabled_lsp_filetypes,
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.lsp_signature')
  end,
})

plugin({
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  commit = 'dbfd8e96ec2696e1ceedcd23fd70e842256e3dea',
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.lsp_lines')
  end,
})

plugin({
  'rmagatti/goto-preview',
  commit = 'a5af27cff485b325f0ef2dcdf55ae51faed05cba',
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.goto-preview')
  end,
})

plugin({
  'jose-elias-alvarez/null-ls.nvim',
  commit = '753ad51790a966b42997ac935e26573fb6d5864a',
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.null-ls')
  end,
})
