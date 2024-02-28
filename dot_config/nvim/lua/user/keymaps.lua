local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = "<Space>"

map("n", "h", "<nop>", opts)
map("n", "j", "<nop>", opts)
map("n", "k", "<nop>", opts)
map("n", "l", "<nop>", opts)

-- Options
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- nvim-tree --
map("n", "<A-e>", "<Cmd>NvimTreeToggle<CR>", opts)

-- LSP
map("n", "tt", "<Cmd>TroubleToggle<CR>", opts)
