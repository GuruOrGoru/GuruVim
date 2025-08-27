
local opts = { noremap = true, silent = true }

local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>", opts)

keymap.set({"n", "v"}, "y", "\"+y", opts)
keymap.set("n", "p", "\"+p", opts)
keymap.set("v", "p", "\"+p", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
