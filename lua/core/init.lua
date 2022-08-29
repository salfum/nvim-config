local vim = vim
local home = os.getenv('HOME')
local cache_dir = home .. '/.cache/nvim/'

local create_dirs = function()
  local data_dir = {
    cache_dir .. 'backup',
    cache_dir .. 'session',
    cache_dir .. 'swap',
    cache_dir .. 'tags',
    cache_dir .. 'undo',
  }

  if vim.fn.isdirectory(cache_dir) == 0 then
    os.execute('mkdir -p ' .. cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. v)
      end
    end
  end
end

local disable_distribution_plugins = function()
  local distribution_plugins = {
    '2html_plugin',
    'bugreport',
    'compiler',
    'ftplugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logiPat',
    'logipat',
    'matchit',
    'matchparen',
    -- 'netrw',
    -- 'netrwFileHandlers',
    -- 'netrwPlugin',
    -- 'netrwSettings',
    'optwin',
    'rplugin',
    'rrhelper',
    'synmenu',
    'syntax',
    'tar',
    'tarPlugin',
    'tutor',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
  }

  for _, plugin in pairs(distribution_plugins) do
    vim.g['loaded_' .. plugin] = 1
  end
end

local load_core = function()
  local pack = require('core.pack')

  create_dirs()
  disable_distribution_plugins()

  pack.ensure_plugins()
  require('core.options')
  pack.load_compile()
  require('keymap')
end

load_core()
