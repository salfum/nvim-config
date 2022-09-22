local plugin = require('core.pack').register_plugin

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = function()
    require('modules.lang.configs.nvim-treesitter')
  end,
})

plugin({
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
})

plugin({
  'salfum/nvim-ts-rainbow',
  after = 'nvim-treesitter',
})

plugin({
  'salfum/nvim-treesitter-context',
  after = 'nvim-treesitter',
  config = function()
    require('modules.lang.configs.nvim-treesitter-context')
  end,
})

plugin({
  'simrat39/symbols-outline.nvim',
  commit = '6a3ed24c5631da7a5d418bced57c16b32af7747c',
  event = 'BufReadPost',
  config = function()
    require('modules.lang.configs.symbols-outline')
  end,
})

plugin({
  'lyokha/vim-xkbswitch',
  commit = 'daab553bb2c6cf9c437780d26e47a8769b4dd7e2',
  config = function()
    require('modules.lang.configs.vim-xkbswitch')
  end,
})
