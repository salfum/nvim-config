local home = os.getenv('HOME')
local lspconfig = require('lspconfig')

require("mason").setup()
require("mason-lspconfig").setup()

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  end
}

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = lsp_keymaps,
})

vim.cmd [[
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
]]

-- diagnostic config

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = {
  Error = '✘',
  Warn = '▲',
  Hint = '⚑',
  Info = '',
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- final assembling

lspconfig.elixirls.setup({
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    }
  }
})

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'hs', 'vim', 'it', 'describe', 'before_each', 'after_each' },
        disable = { 'lowercase-global', 'undefined-global', 'unused-local', 'unused-vararg', 'trailing-space' },
      }
    }
  }
})

local servers_with_default_settings = {}

for _, server in ipairs(servers_with_default_settings) do
  lspconfig[server].setup({})
end
