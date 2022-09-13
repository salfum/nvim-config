vim.g['test#strategy'] = {
  nearest = 'neovim',
  file = 'neovim',
  suite = 'basic',
}

vim.g['test#elixir#runner'] = 'exunit'
vim.g['test#rust#runner'] = 'cargotest'
vim.g['test#lua#runner'] = 'busted'
