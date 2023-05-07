require('lsp-format').setup({
  lua = {
    sync = true,
  },
})

local lsp_format_modifications = require('lsp-format-modifications')

local format_enabled = true

function lsp_format_modification_or_file()
  local format_status, _ = pcall(lsp_format_modifications.format_modifications_current_buffer)

  if format_status ~= true and format_enabled ~= false then
    vim.lsp.buf.format()
  end
end

vim.cmd([[
  autocmd BufWritePre * silent lua lsp_format_modification_or_file()
]])
