local groups = {
  terafox = {
    CursorLine = { bg = '#0F1C1E' },
    ColorColumn = { bg = '#0F1C1E' },
  },
  nightfox = {
    CursorLine = { bg = '#0F1C1E' },
    ColorColumn = { bg = '#0F1C1E' },
  },
}

local palettes = {
  carbonfox = {
    white = '#BBC2CF',
  },
  terafox = {
    white = '#BBC2CF',
  },
}

require('nightfox').setup({
  groups = groups,
  palettes = palettes,
})

vim.cmd('colorscheme terafox')
