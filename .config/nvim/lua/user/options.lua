local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.backup = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.writebackup = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = true
opt.cursorlineopt = "both"
opt.number = true
opt.relativenumber = true
opt.numberwidth = 6
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 15
opt.sidescrolloff = 15
opt.fillchars = "eob: "
opt.foldmethod = "marker"
opt.swapfile = false
opt.hidden = true
opt.history = 50
-- opt.lazyredraw = true

cmd([[colorscheme ayu]])
