local null_ls_status_ok, null_ls = pcall(require, 'null-ls')

if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    formatting.stylua,
    formatting.json_tool,

    -- diagnostics.credo,

    code_actions.gitsigns,

    -- completion.spell,
  },
  on_attach = function(client, bufnr)
  -- local lsp_format_modifications = require('lsp-format-modifications')
  -- lsp_format_modifications.attach(client, bufnr, { format_on_save = false })

    lsp_keymaps()
  end,
})
