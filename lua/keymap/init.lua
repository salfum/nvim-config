require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fg', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
})

-- nvim-lsp
nmap({
  { 'gD', cmd('lua vim.lsp.buf.declaration()'), opts(noremap, silent) },
  { 'gd', cmd('lua vim.lsp.buf.definition()'), opts(noremap, silent) },
  { 'K', cmd('lua vim.lsp.buf.hover()'), opts(noremap, silent) },
  { 'gr', cmd('lua vim.lsp.buf.references()'), opts(noremap, silent) },
  { 'gs', cmd('lua vim.lsp.buf.signature_help()'), opts(noremap, silent) },
  { 'gi', cmd('lua vim.lsp.buf.implementation()'), opts(noremap, silent) },
  { 'gt', cmd('lua vim.lsp.buf.type_definition()'), opts(noremap, silent) },
  { '<Leader>gw', cmd('lua vim.lsp.buf.document_symbol()'), opts(noremap, silent) },
  { '<Leader>gW', cmd('lua vim.lsp.buf.workspace_symbol()'), opts(noremap, silent) },
  { '<Leader>ah', cmd('lua vim.lsp.buf.hover()'), opts(noremap, silent) },
  { '<Leader>af', cmd('lua vim.lsp.buf.code_action()'), opts(noremap, silent) },
  { '<Leader>ee', cmd('lua vim.lsp.util.show_line_diagnostics()'), opts(noremap, silent) },
  { '<Leader>ar', cmd('lua vim.lsp.buf.rename()'), opts(noremap, silent) },
  { '<Leader>=', cmd('lua vim.lsp.buf.formatting()'), opts(noremap, silent) },
  { '<Leader>ai', cmd('lua vim.lsp.buf.incoming_calls()'), opts(noremap, silent) },
  { '<Leader>ao', cmd('lua vim.lsp.buf.outgoing_calls()'), opts(noremap, silent) },
})
