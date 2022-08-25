local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
    vim.cmd([[packadd telescope-file-browser.nvim]])
  end
  require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('projects')
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitSignsAdd', text = '▍', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '▍', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '▍', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
  })
end

function config.hop()
  require('hop').setup({})

  vim.api.nvim_set_keymap('n', '<C-g>', '<cmd>HopWord<cr>', {})
  vim.api.nvim_set_keymap('i', '<C-g>', '<cmd>HopWord<cr>', {})
end

function config.mini()
  require('mini.indentscope').setup({})

  require('mini.cursorword').setup({})
end

function config.cinnamon()
  require('cinnamon').setup({
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = true,
  })
end

return config
