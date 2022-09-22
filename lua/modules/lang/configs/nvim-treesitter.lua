vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

if not packer_plugins['nvim-treesitter-textobjects'].loaded then
  vim.cmd([[packadd nvim-treesitter-textobjects]])
end

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'css',
    'eex',
    'elixir',
    'erlang',
    'gitignore',
    'gleam',
    'graphql',
    'haskell',
    'heex',
    'html',
    'http',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'nix',
    'ocaml',
    'php',
    'query',
    'regex',
    'ruby',
    'rust',
    'scala',
    'scheme',
    'scss',
    'sql',
    'surface',
    'toml',
    'typescript',
    'vim',
    'vue',
    'zig',
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    max_file_lines = nil,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
})
