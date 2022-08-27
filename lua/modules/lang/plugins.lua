local plugin = require('core.pack').register_plugin

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = function()
    require('modules.lang.configs.nvim-treesitter')
  end,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
plugin({ 'salfum/nvim-ts-rainbow', after = 'nvim-treesitter' })
plugin({
  'salfum/nvim-treesitter-context',
  after = 'nvim-treesitter',
  config = function()
    require('modules.lang.configs.nvim-treesitter-context')
  end,
})

plugin({
  'numToStr/Comment.nvim',
  commit = '80e7746e42fa685077a7941e9022308c7ad6adf8',
  config = function()
    require('modules.lang.configs.comment')
  end,
})
