local plugin = require('core.pack').register_plugin

plugin({
  'lewis6991/impatient.nvim',
  commit = 'b842e16ecc1a700f62adb9802f8355b99b52a5a6',
})

plugin({ 'nvim-lua/plenary.nvim' })

plugin({
  'nvim-telescope/telescope.nvim',
  after = 'plenary.nvim',
  event = { 'CmdlineEnter', 'CursorHold' },
  config = function()
    require('modules.tools.configs.telescope')
  end,
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    {
      'jvgrootveld/telescope-zoxide',
      commit = 'dbd9674e31e5caccae054a4ccee24ff8d1f2053f',
    },
    {
      'AckslD/nvim-neoclip.lua',
      commit = '74af02e289b3ea465bc8a4d7b9b83adc4e4b8c06',
      config = function()
        require('modules.tools.configs.nvim-neoclip')
      end,
    },
  },
})

plugin({
  'lewis6991/gitsigns.nvim',
  commit = '1e107c91c0c5e3ae72c37df8ffdd50f87fb3ebfa',
  ft = 'gitcommit',
  event = 'BufReadPost',
  config = function()
    require('modules.tools.configs.gitsigns')
  end,
})

plugin({
  'sindrets/diffview.nvim',
  commit = 'e0c81186dcb96f9199024cbe3400ed367e716037',
  requires = 'nvim-lua/plenary.nvim',
})

plugin({
  'mg979/vim-visual-multi',
  event = 'BufReadPost',
  commit = 'e23b98a8852255766e54bf7723a9d61fb5ab3143',
})

plugin({
  'ggandor/leap.nvim',
  commit = '91897282189608125025e804912cebbc7c947ce5',
  event = 'BufReadPost',
  config = function()
    require('modules.tools.configs.leap')
  end,
})

plugin({
  'echasnovski/mini.nvim',
  branch = 'stable',
  commit = '06eddfd8d6341e6c4f53ec9ae109a376a566329d',
  event = 'BufReadPost',
  config = function()
    require('modules.tools.configs.mini')
  end,
})

plugin({
  'dinhhuy258/vim-local-history',
  commit = '000b8acecd14ff005a4e1198c82be901c7fbe904',
  event = 'BufReadPost',
  run = ':UpdateRemotePlugins',
  config = function()
    require('modules.tools.configs.vim-local-history')
  end,
})

plugin({
  'declancm/cinnamon.nvim',
  commit = '7594df88c798df7a9cf9f4bf14e7fd145035d71d',
  event = 'BufReadPost',
  config = function()
    require('modules.tools.configs.cinnamon')
  end,
})

plugin({
  'ahmedkhalf/project.nvim',
  commit = '090bb11ee7eb76ebb9d0be1c6060eac4f69a240f',
  config = function()
    require('modules.tools.configs.project')
  end,
})

plugin({
  'ThePrimeagen/harpoon',
  commit = 'f4aff5bf9b512f5a85fe20eb1dcf4a87e512d971',
  after = 'plenary.nvim',
  config = function()
    require('modules.tools.configs.harpoon')
  end,
})

plugin({
  'vim-test/vim-test',
  commit = '4cbc269b7a8095fd500d80fda1e92bbe3769285f',
  ft = { 'elixir', 'lua', 'rust' },
  event = 'BufReadPost',
  config = function()
    require('modules.tools.configs.vim-test')
  end,
})

plugin({
  'chaoren/vim-wordmotion',
  commit = '5dd613ed68a0ecf0fc6c11cd4098c03583786bf0',
  event = 'InsertEnter',
})

plugin({
  'rmagatti/auto-session',
  commit = '9c302e01ebb474f9b19998488060d9f110ef75c5',
  disable = true,
  config = function()
    require('modules.tools.configs.auto-session')
  end,
})

plugin({
  'iamcco/markdown-preview.nvim',
  run = function()
    vim.fn['mkdp#util#install']()
  end,
})
