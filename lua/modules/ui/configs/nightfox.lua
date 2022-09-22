local groups = {
  all = {
    CursorLine = { bg = 'palette.bg0' },
    ColorColumn = { bg = 'palette.bg0' },
  },
  carbonfox = {
    String = { fg = '#81b29a' },
  },
}

local palettes = {
  all = {
    white = '#BBC2CF',
  },
}

require('nightfox').setup({
  groups = groups,
  palettes = palettes,
})

vim.cmd('colorscheme carbonfox')
