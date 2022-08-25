local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({ 'lewis6991/impatient.nvim' })

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
  },
})

plugin({
  'lewis6991/gitsigns.nvim',
  config = conf.gitsigns,
})

plugin({ 'mg979/vim-visual-multi' })

plugin({
  'ggandor/leap.nvim',
  config = function()
    require('leap').set_default_keymaps()
  end,
})

plugin({
  'echasnovski/mini.nvim',
  branch = 'stable',
  commit = '4cc8b445df6234bccfe3c3dbdbb3fe64cd3861c5',
  config = conf.mini,
})

plugin({
  'kylechui/nvim-surround',
  commit = '328f20c1d0e39ed30df3fc6334c093e8e8b72453',
  config = function()
    require('nvim-surround').setup({})
  end,
})

if vim.g.python3_host_prog then
  plugin({
    'dinhhuy258/vim-local-history',
    branch = 'master',
    run = ':UpdateRemotePlugins',
    config = function()
      vim.g.local_history_path = os.getenv('HOME') .. '/.local-history'
      vim.g.local_history_max_changes = 200
      vim.local_history_exclude = {
        '**/node_modules/**',
        '**/deps/**',
        '*.txt',
      }
    end,
  })
end

plugin({
  'declancm/cinnamon.nvim',
  config = conf.cinnamon,
})

plugin({
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup({})
  end,
})
