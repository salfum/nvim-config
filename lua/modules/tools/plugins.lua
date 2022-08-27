local plugin = require('core.pack').register_plugin

plugin({ 'lewis6991/impatient.nvim' })

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = function()
    require('modules.tools.configs.telescope')
  end,
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
  },
})

plugin({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('modules.tools.configs.gitsigns')
  end,
})

plugin({ 'mg979/vim-visual-multi' })

plugin({
  'ggandor/leap.nvim',
  config = function()
    require('modules.tools.configs.leap')
  end,
})

plugin({
  'echasnovski/mini.nvim',
  branch = 'stable',
  commit = '4cc8b445df6234bccfe3c3dbdbb3fe64cd3861c5',
  config = function()
    require('modules.tools.configs.mini')
  end,
})

plugin({
  'kylechui/nvim-surround',
  commit = '328f20c1d0e39ed30df3fc6334c093e8e8b72453',
  config = function()
    require('modules.tools.configs.nvim-surround')
  end,
})

if vim.g.python3_host_prog then
  plugin({
    'dinhhuy258/vim-local-history',
    branch = 'master',
    run = ':UpdateRemotePlugins',
    config = function()
      require('modules.tools.configs.vim-local-history')
    end,
  })
end

plugin({
  'declancm/cinnamon.nvim',
  config = function()
    require('modules.tools.configs.cinnamon')
  end,
})

plugin({
  'ahmedkhalf/project.nvim',
  config = function()
    require('modules.tools.configs.project')
  end,
})
