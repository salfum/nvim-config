require('nvim-tree').setup({
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  -- project.nvim
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
