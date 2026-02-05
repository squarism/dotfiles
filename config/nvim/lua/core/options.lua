-- core vim options

local opt = vim.opt

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
opt.guicursor:append("n:ver20-Cursor/lCursor")

-- disable mouse
opt.mouse = ""

-- files
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

-- text
opt.textwidth = 110
opt.scrolloff = 4

-- whitespace visibility
opt.list = true
opt.listchars = { trail = "·" }

-- search
opt.hlsearch = false
opt.incsearch = true

-- completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.complete = ""

-- filetype detection (syntax highlighting handled by treesitter)
vim.cmd("filetype plugin indent on")
