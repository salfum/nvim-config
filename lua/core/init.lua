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

-- disable_distribution_plugins
local disable_distribution_plugins = function()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
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
