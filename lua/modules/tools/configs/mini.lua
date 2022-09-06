vim.g.miniai_disable = true
vim.g.minibufremove_disable = true
vim.g.minicompletion_disable = true
vim.g.minicursorword_disable = false
vim.g.minidoc_disable = true
vim.g.miniindentscope_disable = false
vim.g.minijump2d_disable = true
vim.g.minipairs_disable = false
vim.g.minisessions_disable = true
vim.g.ministarter_disable = true
vim.g.ministatusline_disable = true
vim.g.minisurround_disable = true
vim.g.minitabline_disable = true
vim.g.minitest_disable = true
vim.g.minitrailspace_disable = true

local plugins = {
  'indentscope',
  'cursorword',
  'pairs',
}

for _, plugin_name in ipairs(plugins) do
  require('mini.' .. plugin_name).setup({})
end
