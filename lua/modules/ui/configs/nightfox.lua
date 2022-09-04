local groups = {
  terafox = {
    CursorLine = { bg = '#212829' },
    ColorColumn = { bg = '#212829' },
  },
  nightfox = {
    CursorLine = { bg = '#212829' },
    ColorColumn = { bg = '#212829' },
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
