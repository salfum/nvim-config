local keymap = require('core.keymap')
local nmap, imap, cmap, vmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- leaderkey
vim.g.mapleader = ' '
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

vmap({ '<S-Y>', '"+y', opts(noremap) })

nmap({
  -- close buffer
  { '<C-w>', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
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
  { '<C-s>', cmd('write'), opts(noremap) },
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-l>', '<Del>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { '<C-a>', '<Home>', opts(noremap) },
  -- quick escape from insert mode
  { 'jj', '<Esc>', opts(noremap) }
})

cmap({
  { '<C-b>', '<Left>', opts(noremap) },
  { '<C-V>', '<C-r>+', opts(noremap) },
})

nmap({
  { '<Tab>', cmd('bnext') },
  { '<S-Tab>', cmd('bprevious') },
})
