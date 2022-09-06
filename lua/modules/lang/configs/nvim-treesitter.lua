vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

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
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
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
