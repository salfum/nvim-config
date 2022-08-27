local plugin = require('core.pack').register_plugin

plugin({
  'jsit/toast.vim',
  config = function()
    require('modules.ui.configs.toast')
  end,
})

plugin({
  'glepnir/dashboard-nvim',
  config = function()
    require('modules.ui.configs.dashboard-nvim')
  end,
})

plugin({
  'glepnir/galaxyline.nvim',
  branch = 'main',
  config = function()
    require('modules.ui.configs.galaxyline')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = function()
    require('modules.ui.configs.nvim-tree')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'akinsho/nvim-bufferline.lua',
  config = function()
    require('modules.ui.configs.nvim-bufferline')
  end,
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'j-hui/fidget.nvim',
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

plugin({
  'antoinemadec/FixCursorHold.nvim',
  event = 'BufReadPre',
  config = function()
    require('modules.ui.configs.fixcursorhold')
  end,
})
