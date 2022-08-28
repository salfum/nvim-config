local home = os.getenv('HOME')
local db = require('dashboard')

db.session_directory = home .. '/.cache/nvim/session'
db.preview_command = 'cat'
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 15
db.preview_file_width = 33
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
