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
