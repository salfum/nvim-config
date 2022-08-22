local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
plugin({ 'salfum/nvim-ts-rainbow', after = 'nvim-treesitter' })
plugin({
  'salfum/nvim-treesitter-context',
  after = 'nvim-treesitter',
  config = conf.treesitter_context,
})

plugin({
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
})
