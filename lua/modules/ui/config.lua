local config = {}

function config.toast()
  vim.cmd('colorscheme toast')

  vim.cmd([[highlight StatusLine cterm=reverse ctermfg=242 ctermbg=242 gui=reverse guifg=#202328 guibg=#202328]])

  vim.cmd([[highlight GitSignsAdd ctermbg=0 guifg=#5F782F guibg=NONE]])
  vim.cmd([[highlight GitSignsChange ctermbg=0 guifg=#FFCB6B guibg=NONE]])
  vim.cmd([[highlight GitSignsDelete ctermbg=0 guifg=#F07178 guibg=NONE]])
end

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.session_directory = home .. '/.cache/nvim/session'
  db.preview_command = 'cat'
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
    {
      icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
    {
      icon = '  ',
      desc = 'Sync Plugins                            ',
      shortcut = 'SPC p u',
      action = 'PackerSync',
    },
  }
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
      offsets = {
        {
          filetype = 'NvimTree',
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    -- project.nvim
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  })
end

return config
