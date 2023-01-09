local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = "<Space>"

map("n", "h", "<nop>", opts)
map("n", "j", "<nop>", opts)
map("n", "k", "<nop>", opts)
map("n", "l", "<nop>", opts)

-- Options
map("n", "w", "<cmd>w<cr>", opts)
map("n", "q", "<cmd>q<cr>", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- barbar --
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- map("n", "<A-,>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A-.>", "<Cmd>BufferMoveNext<CR>", opts)

-- nvim-tree --
map("n", "<A-e>", "<Cmd>NvimTreeToggle<CR>", opts)

-- LSP
map("n", "tt", "<Cmd>TroubleToggle<CR>", opts)
