local plugin = require('core.pack').register_plugin

plugin({
  'EdenEast/nightfox.nvim',
  commit = 'e2f961859cbfb2ba38147dc59fdd2314992c8b62',
  config = function()
    require('modules.ui.configs.nightfox')
  end,
  run = ':NightfoxCompile',
})

plugin({
  'glepnir/dashboard-nvim',
  commit = 'e0a22675a48fbe1ed9b4e7c2ff083108cc8bce94',
  config = function()
    require('modules.ui.configs.dashboard-nvim')
  end,
})

plugin({
  'glepnir/galaxyline.nvim',
  commit = 'eb81be07bf690c5ef7474ace72920b32ad089585',
  config = function()
    require('modules.ui.configs.galaxyline')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'kyazdani42/nvim-tree.lua',
  commit = 'ce5d0a6b7ddfec622554943d2ebcc739b1d74567',
  cmd = 'NvimTreeToggle',
  config = function()
    require('modules.ui.configs.nvim-tree')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'akinsho/nvim-bufferline.lua',
  commit = 'fb7b17362eb6eedc57c37bdfd364f8e7d8149e31',
  config = function()
    require('modules.ui.configs.nvim-bufferline')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'j-hui/fidget.nvim',
  commit = '492492e7d50452a9ace8346d31f6d6da40439f0e',
  config = function()
    require('modules.ui.configs.fidget')
  end,
})

plugin({
  'salfum/satellite.nvim',
  config = function()
    require('modules.ui.configs.satellite')
  end,
})

-- Necessary until this issue is open
-- https://github.com/neovim/neovim/issues/12587
plugin({
  'antoinemadec/FixCursorHold.nvim',
  commit = '5aa5ff18da3cdc306bb724cf1a138533768c9f5e',
  event = 'BufReadPre',
  config = function()
    require('modules.ui.configs.fixcursorhold')
  end,
})
