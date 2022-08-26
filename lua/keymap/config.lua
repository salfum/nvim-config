local keymap = require('core.keymap')
local nmap, imap, cmap, vmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap, keymap.xmap
local silent, noremap, expr = keymap.silent, keymap.noremap, keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd

-- leaderkey
vim.g.mapleader = ' '
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

vmap({
  { '<S-Y>', '"+y', opts(noremap) },
  { 'p', cmd('p:let @+=@0<CR>:let @"=@0<CR>'), opts(silent) },
})

nmap({
  { '<C-w>', cmd('bdelete'), opts(noremap, silent) }, -- close buffer
  { '<C-s>', cmd('write'), opts(noremap) }, -- save
  { 'Y', 'y$', opts(noremap) }, -- yank
  { '<Escape>', cmd('noh'), opts(noremap) }, -- no highlight
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },
})

imap({
  { 'jj', '<Esc>', opts(noremap) }, -- quick escape from insert mode
  { '<C-s>', cmd('write'), opts(noremap) }, -- save file
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-l>', '<Del>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { '<C-a>', '<Home>', opts(noremap) },
})

cmap({
  { '<C-b>', '<Left>', opts(noremap) },
  { '<C-V>', '<C-r>+', opts(noremap) },
})

nmap({
  { '<Tab>', cmd('bnext') },
  { '<S-Tab>', cmd('bprevious') },
  -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  { 'j', cmd('v:count || mode(1)[0:1] == "no" ? "j" : "gj"'), opts(expr) },
  { 'Down', cmd('v:count || mode(1)[0:1] == "no" ? "j" : "gj"'), opts(expr) },
  { 'k', cmd('v:count || mode(1)[0:1] == "no" ? "j" : "gk"'), opts(expr) },
  { 'Up', cmd('v:count || mode(1)[0:1] == "no" ? "j" : "gk"'), opts(expr) },
})
