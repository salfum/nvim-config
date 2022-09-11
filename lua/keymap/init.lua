require('keymap.config')
local keymap = require('core.keymap')
local nmap, imap, vmap, xmap = keymap.nmap, keymap.imap, keymap.vmap, keymap.xmap
local silent, noremap, buffer = keymap.silent, keymap.noremap, keymap.buffer
local opts = keymap.new_opts
local cmd = keymap.cmd

nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  { '<Leader>ps', cmd('PackerSync'), opts(noremap, silent) },
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
  { '<Leader>fr', cmd('Telescope oldfiles'), opts(noremap, silent) },
  { '<Leader>fn', cmd('Telescope command_history'), opts(noremap, silent) },
  { '<Leader>fw', cmd('Telescope grep_string'), opts(noremap, silent) },
  { '<Leader>fz', cmd('Telescope zoxide list'), opts(noremap, silent) },
  { '<Leader>fc', cmd('Telescope neoclip a extra=star,plus,b'), opts(noremap, silent) },
  { '<Leader>fh', cmd('Telescope harpoon marks'), opts(noremap, silent) },
  { '<Leader>fs', cmd('Telescope git_status'), opts(noremap, silent) },
  { '<F5>', cmd('LocalHistoryToggle'), opts(noremap, silent) },
  -- project.nvim
  { '<leader>p', cmd('Telescope projects'), opts(noremap, silent) },
  -- Comment.nvim
  { '<leader>/', cmd('lua require("Comment.api").toggle.linewise.current()'), opts(silent) },
  -- harpoon.nvim
  { '<leader>mm', cmd('lua require("harpoon.mark").add_file()'), opts(noremap, silent) },
  { '<leader>mn', cmd('lua require("harpoon.ui").nav_next()'), opts(noremap, silent) },
  { '<leader>mp', cmd('lua require("harpoon.ui").nav_prev()'), opts(noremap, silent) },
  -- symbols_outline.nvim
  { '<leader>t', cmd('SymbolsOutline'), opts(noremap, silent) },
  -- true-zen.nvim
  { '<leader>zn', cmd('TZNarrow'), opts(noremap, silent) },
  { '<leader>zf', cmd('TZFocus'), opts(noremap, silent) },
  { '<leader>zm', cmd('TZMinimalist'), opts(noremap, silent) },
  { '<leader>za', cmd('TZAtaraxis'), opts(noremap, silent) },
  -- lsp_lines.nvim
  { '<leader>l', cmd('lua require("lsp_lines").toggle'), opts(noremap, silent) },
  -- goto-preview
  { 'gad', cmd('lua require("goto-preview").goto_preview_definition()'), opts(noremap) },
  { 'gat', cmd('lua require("goto-preview").goto_preview_type_definition()'), opts(noremap) },
  { 'gai', cmd('lua require("goto-preview").goto_preview_implementation()'), opts(noremap) },
  { 'gar', cmd('lua require("goto-preview").goto_preview_references()'), opts(noremap) },
  { 'gA', cmd('lua require("goto-preview").close_all_win()'), opts(noremap) },
})

vmap({
  -- Comment.nvim
  { '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts(silent) },
  -- true-zen.nvim
  { '<leader>zn', cmd("'<,'>TZNarrow"), opts(noremap, silent) },
})

nmap({ '<C-g>', cmd("lua require('leap').leap { target_windows = { vim.fn.win_getid() } }"), opts(noremap) })
imap({ '<C-g>', cmd("lua require('leap').leap { target_windows = { vim.fn.win_getid() } }"), opts(noremap) })

lsp_keymaps = function()
  nmap({
    -- Displays hover information about the symbol under the cursor
    { 'K', cmd('lua vim.lsp.buf.hover()'), opts(noremap, buffer) },
    -- Jump to the definition
    { 'gd', cmd('lua vim.lsp.buf.definition()'), opts(noremap, buffer) },
    -- Jump to declaration
    { 'gD', cmd('lua vim.lsp.buf.declaration()'), opts(noremap, buffer) },
    -- Lists all the implementations for the symbol under the cursor
    { 'gi', cmd('lua vim.lsp.buf.implementation()'), opts(noremap, buffer) },
    -- Jumps to the definition of the type symbol
    { 'go', cmd('lua vim.lsp.buf.type_definition()'), opts(noremap, buffer) },
    -- Lists all the references
    { 'gr', cmd('Telescope lsp_references'), opts(noremap, buffer) },
    -- Displays a function's signature information
    { 'gK', cmd('lua vim.lsp.buf.signature_help()'), opts(noremap, buffer) },
    -- Renames all references to the symbol under the cursor
    { '<F2>', cmd('lua vim.lsp.buf.rename()'), opts(noremap, buffer) },
    -- Selects a code action available at the current cursor position
    { '<F4>', cmd('lua vim.lsp.buf.code_action()'), opts(noremap, buffer) },
    -- Show diagnostics in a floating window
    { 'gl', cmd('lua vim.diagnostic.open_float()'), opts(noremap, buffer) },
    -- Move to the previous diagnostic
    { '[d', cmd('lua vim.diagnostic.goto_prev()'), opts(noremap, buffer) },
    -- Move to the next diagnostic
    { ']d', cmd('lua vim.diagnostic.goto_next()'), opts(noremap, buffer) },
    -- Format file
    { '=', cmd('lua vim.lsp.buf.formatting()'), opts(noremap, buffer) },

    -- currently unused lsp mappings
    -- { '<Leader>ee', cmd('lua vim.lsp.util.show_line_diagnostics()'), opts(noremap, silent, buffer) },
    -- { '<Leader>gw', cmd('lua vim.lsp.buf.document_symbol()'), opts(noremap, silent) },
    -- { '<Leader>gW', cmd('lua vim.lsp.buf.workspace_symbol()'), opts(noremap, silent) },
    -- { '<Leader>ai', cmd('lua vim.lsp.buf.incoming_calls()'), opts(noremap, silent) },
    -- { '<Leader>ao', cmd('lua vim.lsp.buf.outgoing_calls()'), opts(noremap, silent) },
  })

  xmap(
    -- Selects a code action available at the selected lines
    { '<F4>', cmd('lua vim.lsp.buf.range_code_action()'), opts(noremap, silent, buffer) }
  )
end
