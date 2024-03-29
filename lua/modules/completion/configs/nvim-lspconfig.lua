local home = os.getenv('HOME')
local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({})

local basic_capabilities = vim.lsp.protocol.make_client_capabilities()
basic_capabilities.textDocument.completion.completionItem.snippetSupport = true
basic_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local disabled_formatting_servers = {
  'lua_ls',
}

if not packer_plugins['cmp-nvim-lsp'].loaded then
  vim.cmd([[packadd cmp-nvim-lsp]])
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(basic_capabilities)

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require('lsp_signature').on_attach(client, bufnr)
    require('lsp-format').on_attach(client)
    vim.api.nvim_create_augroup("Format", {})

    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  end,
}

lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

-- diagnostic config

vim.diagnostic.config({
  virtual_text = false,
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
  local hl = 'DiagnosticSign' .. type
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
    },
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'hs', 'vim', 'it', 'describe', 'before_each', 'after_each' },
        disable = { 'lowercase-global', 'undefined-global', 'unused-local', 'unused-vararg', 'trailing-space' },
      },
      completion = {
        keywordSnippet = 'Replace',
        callSnippet = 'Replace',
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

servers_with_default_settings = {
  'jsonls',
}

for _, server in ipairs(servers_with_default_settings) do
  lspconfig[server].setup({})
end
