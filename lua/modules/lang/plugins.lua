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
plugin({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' })

plugin({
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
})
