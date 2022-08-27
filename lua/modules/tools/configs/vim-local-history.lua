vim.g.local_history_path = os.getenv('HOME') .. '/.local-history'
vim.g.local_history_max_changes = 200
vim.local_history_exclude = {
  '**/node_modules/**',
  '**/deps/**',
  '*.txt',
}
