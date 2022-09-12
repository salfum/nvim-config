if not packer_plugins['plenary.nvim'].loaded then
  vim.cmd([[packadd plenary.nvim]])
  vim.cmd([[packadd popup.nvim]])
end

local file_ignore_patterns = {
  'node_modules',
  'deps',
}

vim.g.theme_switcher_loaded = true

colors = {
  white = '#F8F8F2',
  darker_black = '#222430',
  black = '#282A36', --  nvim bg
  black2 = '#2d303e',
  one_bg = '#373844', -- real bg of onedark
  one_bg2 = '#44475a',
  one_bg3 = '#565761',
  grey = '#5e5f69',
  grey_fg = '#666771',
  grey_fg2 = '#6e6f79',
  light_grey = '#73747e',
  red = '#ff7070',
  baby_pink = '#ff86d3',
  pink = '#FF79C6',
  line = '#3c3d49', -- for lines like vertsplit
  green = '#50fa7b',
  vibrant_green = '#5dff88',
  nord_blue = '#8b9bcd',
  blue = '#a1b1e3',
  yellow = '#F1FA8C',
  sun = '#FFFFA5',
  purple = '#BD93F9',
  dark_purple = '#BD93F9',
  teal = '#92a2d4',
  orange = '#FFB86C',
  cyan = '#8BE9FD',
  statusline_bg = '#2d2f3b',
  lightbg = '#41434f',
  pmenu_bg = '#b389ef',
  folder_bg = '#BD93F9',
}

group = {
  TSFuncBuiltin = { fg = colors.cyan },

  TSNumber = { fg = colors.purple },

  TelescopeBorder = {
    fg = colors.darker_black,
    bg = colors.darker_black,
  },

  TelescopePromptBorder = {
    fg = colors.black2,
    bg = colors.black2,
  },

  TelescopePromptNormal = {
    fg = colors.white,
    bg = colors.black2,
  },

  TelescopePromptPrefix = {
    fg = colors.red,
    bg = colors.black2,
  },

  TelescopeNormal = { bg = colors.darker_black },

  TelescopePreviewTitle = {
    fg = colors.black,
    bg = colors.green,
  },

  TelescopePromptTitle = {
    fg = colors.black,
    bg = colors.red,
  },

  TelescopeResultsTitle = {
    fg = colors.darker_black,
    bg = colors.darker_black,
  },

  TelescopeSelection = { bg = colors.black2, fg = colors.white },

  TelescopeResultsDiffAdd = {
    fg = colors.green,
  },

  TelescopeResultsDiffChange = {
    fg = colors.yellow,
  },

  TelescopeResultsDiffDelete = {
    fg = colors.red,
  },
}

load_highlight = function(group)
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

-- automatic change telescope colorscheme
-- when neovim colorscheme changes
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  pattern = '*',
  callback = function()
    load_highlight(group)
  end,
})

local plenary_status_ok, _ = pcall(require, 'plenary')
local telescope_status_ok, _ = pcall(require, 'telescope')

if plenary_status_ok and telescope_status_ok then
  load_highlight(group)

  require('telescope').setup({
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      prompt_prefix = '   ',
      selection_caret = '  ',
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      layout_strategy = 'horizontal',
      sorting_strategy = 'ascending',

      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = require('telescope.sorters').get_fuzzy_file,
      file_ignore_patterns = file_ignore_patterns,
      generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
      path_display = { 'truncate' },
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,

      mappings = {
        n = { ['q'] = require('telescope.actions').close },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  })

  if not packer_plugins['telescope-fzf-native.nvim'].loaded then
    vim.cmd([[packadd telescope-fzf-native.nvim]])
  end

  require('telescope').load_extension('fzf')

  if not packer_plugins['telescope-zoxide'].loaded then
    vim.cmd([[packadd telescope-zoxide]])
  end

  require('telescope').load_extension('zoxide')

  if not packer_plugins['harpoon'].loaded then
    vim.cmd([[packadd harpoon]])
  end

  require('telescope').load_extension('harpoon')

  require('telescope').load_extension('projects')
end
