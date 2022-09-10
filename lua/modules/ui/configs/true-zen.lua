require('true-zen').setup({
  modes = {
    ataraxis = {
      callbacks = {
        open_pre = function()
          vim.api.nvim_command('SatelliteEnable')
        end,
        close_pre = function()
          vim.api.nvim_command('SatelliteEnable')
        end,
      },
      padding = { -- padding windows
        left = 50,
        right = 50,
        top = 0,
        bottom = 0,
      },
    },
  },
})
