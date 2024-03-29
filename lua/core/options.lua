local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
local opt = vim.opt
local vim_version = vim.version().minor

function define_options()
  -- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
  if vim_version < 8 then
    vim.g.did_load_filetypes = 0
    vim.g.do_filetype_lua = 1
  end

  opt.backspace = { 'indent', 'eol', 'start' }
  opt.backup = false
  opt.backupdir = cache_dir .. 'backup/'
  opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
  opt.breakat = [[\ \	;:,!?]]
  opt.clipboard = 'unnamedplus'
  opt.complete = '.,w,b,k'
  opt.completeopt = 'menu,menuone,noselect'
  opt.cursorline = true
  opt.diffopt = 'filler,iwhite,internal,algorithm:patience'
  opt.directory = cache_dir .. 'swag/'
  opt.encoding = 'utf-8'
  opt.errorbells = true
  opt.fileformats = 'unix,mac,dos'
  opt.fillchars = 'eob: ' -- remove tildes in the end of buffer
  opt.foldlevelstart = 99
  opt.grepformat = '%f:%l:%c:%m'
  opt.grepprg = 'rg --hidden --vimgrep --smart-case --'
  opt.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50'
  opt.guifont = { 'FiraCode Nerd Font Mono', ':h14' }
  opt.helpheight = 12
  opt.history = 2000
  opt.ignorecase = true
  opt.inccommand = 'nosplit'
  opt.infercase = true
  opt.jumpoptions = 'stack'
  opt.lazyredraw = true
  opt.list = true
  opt.magic = true
  opt.mouse = 'a'
  opt.previewheight = 12
  opt.pumheight = 15
  opt.redrawtime = 1500
  opt.ruler = false
  opt.scrolloff = 2
  opt.sessionoptions = 'curdir,help,tabpages,winsize'
  opt.shada = "!,'300,<50,@100,s10,h"
  opt.shiftround = true
  opt.shortmess = 'aoOTIcF'
  opt.showmode = false
  opt.showtabline = 2
  opt.sidescrolloff = 5
  opt.smartcase = true
  opt.smartindent = true
  opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
  opt.splitbelow = true
  opt.splitright = true
  opt.startofline = false
  opt.swapfile = false
  opt.switchbuf = 'useopen'
  opt.termguicolors = true
  opt.timeout = true
  opt.timeoutlen = 500
  opt.title = true
  opt.ttimeout = true
  opt.ttimeoutlen = 10
  opt.undodir = cache_dir .. 'undo/'
  opt.updatetime = 100
  opt.viewdir = cache_dir .. 'view/'
  opt.viewoptions = 'folds,cursor,curdir,slash,unix'
  opt.virtualedit = 'block'
  opt.visualbell = true
  opt.whichwrap = 'h,l,<,>,[,],~'
  opt.wildignore =
    '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
  opt.wildignorecase = true
  opt.winminwidth = 10
  opt.winwidth = 30
  opt.wrapscan = true
  opt.writebackup = false

  -- Neovim Nightly options
  opt.cmdheight = 1
  opt.cmdwinheight = 5
  opt.display = 'lastline'
  opt.equalalways = false
  opt.laststatus = 2
  opt.listchars = { tab = '»·', nbsp = '+', trail = '·', extends = '→', precedes = '←' }
  opt.pumblend = 10
  opt.showbreak = '↳  '
  opt.winblend = 10

  opt.autoindent = true
  opt.copyindent = true
  opt.breakindentopt = 'shift:2,min:20'
  opt.colorcolumn = '80'
  opt.concealcursor = 'niv'
  opt.conceallevel = 2
  opt.expandtab = true
  opt.foldenable = true
  opt.formatoptions = '1jcroql'
  opt.linebreak = true
  opt.number = true
  opt.shiftwidth = 2
  opt.signcolumn = 'yes'
  opt.softtabstop = -1
  opt.synmaxcol = 2500
  opt.tabstop = 2
  opt.textwidth = 80
  opt.undofile = true
  opt.wrap = false

  -- clients and plugin hosts settings
  vim.g.python2 = '/usr/bin/python2'
  vim.g.python3 = '/usr/bin/python3'
  vim.g.python_host_prog = '/usr/bin/python2'
  vim.g.python3_host_prog = '/usr/bin/python3'

  vim.g.loaded_node_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
end

--- Remembers the last cursor position in a file
function remember_cursor_position()
  local group = vim.api.nvim_create_augroup('RememberCursorPosition', { clear = true })

  vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = '*',
    group = group,
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
  })
end

--- Highlights the copied part of the text for a fraction of a second
function yank_highlight()
  local group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

  vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    pattern = '*',
    group = group,
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700 })
    end,
  })
end

--- Automatic toggle relative numbers between modes
function relativenumber_autotoggle()
  local group = vim.api.nvim_create_augroup('RelativeNumberToggle', { clear = true })

  vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
    pattern = '*',
    group = group,
    command = 'if &nu && mode() != "i" | set rnu | endif',
  })

  vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
    pattern = '*',
    group = group,
    command = 'if &nu | set nornu | endif',
  })
end

define_options()
remember_cursor_position()
yank_highlight()
relativenumber_autotoggle()
