local plugin = require('core.pack').register_plugin

plugin({
  'lewis6991/impatient.nvim',
  commit = 'b842e16ecc1a700f62adb9802f8355b99b52a5a6',
})

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
  config = function()
    require('modules.tools.configs.gitsigns')
  end,
})

plugin({
  'mg979/vim-visual-multi',
  commit = 'e23b98a8852255766e54bf7723a9d61fb5ab3143',
})

plugin({
  'ggandor/leap.nvim',
  commit = '91897282189608125025e804912cebbc7c947ce5',
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
    commit = '000b8acecd14ff005a4e1198c82be901c7fbe904',
    run = ':UpdateRemotePlugins',
    config = function()
      require('modules.tools.configs.vim-local-history')
    end,
  })
end

plugin({
  'declancm/cinnamon.nvim',
  commit = '7594df88c798df7a9cf9f4bf14e7fd145035d71d',
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
