local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local exec = vim.api.nvim_exec

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
opt.showtabline = 1
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.writebackup = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.number = true
opt.relativenumber = false
opt.numberwidth = 6
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 25
opt.sidescrolloff = 25
opt.swapfile = false
opt.hidden = true
opt.history = 50
opt.clipboard = "unnamedplus"

exec(
    [[
    augroup tabtospace
        autocmd BufWritePre * set expandtab
        autocmd BufWritePre * retab
    augroup END
]],
    false
)

exec(
    [[
    augroup templates
        autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/templates/'.expand("<afile>:e").'.tmpl'
    augroup END
]],
    false
)

cmd([[colorscheme ayu-mirage]])
