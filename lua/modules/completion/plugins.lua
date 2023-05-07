local plugin = require('core.pack').register_plugin

enabled_lsp_filetypes = {
  'elixir',
  'lua',
  'rust',
}

plugin({
  'williamboman/mason.nvim',
})

plugin({
  'williamboman/mason-lspconfig.nvim',
  after = 'mason.nvim',
})

plugin({
  'neovim/nvim-lspconfig',
  ft = enabled_lsp_filetypes,
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.nvim-lspconfig')
  end,
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
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', ft = { 'lua' } },
  },
})

plugin({
  'L3MON4D3/LuaSnip',
  after = 'nvim-cmp',
  event = 'BufReadPost',
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
  commit = '07d4ed4c6b561914aafd787453a685598bec510f',
  event = 'BufReadPost',
  config = function()
    require('modules.completion.configs.null-ls')
  end,
})

plugin({
  'lukas-reineke/lsp-format.nvim',
  config = function()
    require('modules.completion.configs.lsp-format')
  end,
})

plugin({
  'joechrisellis/lsp-format-modifications.nvim',
})
