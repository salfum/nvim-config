vim.g.miniai_disable = true
vim.g.minibufremove_disable = false
vim.g.minicomment_disable = false
vim.g.minicompletion_disable = true
vim.g.minicursorword_disable = false
vim.g.minidoc_disable = true
vim.g.miniindentscope_disable = false
vim.g.minijump2d_disable = true
vim.g.minipairs_disable = false
vim.g.minisessions_disable = true
vim.g.ministarter_disable = true
vim.g.ministatusline_disable = true
vim.g.minisurround_disable = false
vim.g.minitabline_disable = true
vim.g.minitest_disable = true
vim.g.minitrailspace_disable = true

local plugins = {
  'bufremove',
  'cursorword',
  'indentscope',
  'comment',
  'pairs',
}

for _, plugin_name in ipairs(plugins) do
  require('mini.' .. plugin_name).setup({})
end

require('mini.surround').setup({
  mappings = {
    add = '<leader>sa',
    delete = '<leader>sd',
    find = '<leader>sf',
    find_left = '<leader>sF',
    highlight = '<leader>sh',
    replace = '<leader>sc',
    update_n_lines = '<leader>sn',

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})
