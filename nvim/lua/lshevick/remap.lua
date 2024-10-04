vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>silent :Lexplore!<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>c", "<cmd>silent :set hlsearch!<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>silent :Git blame<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>silent :sp | term<CR>")
vim.keymap.set("n", "<leader>~", "<cmd>silent :source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>x", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>]])
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>1", '1gt')
vim.keymap.set("n", "<leader>2", '2gt')
vim.keymap.set("n", "<leader>3", '3gt')
vim.keymap.set("n", "<leader>4", '4gt')
vim.keymap.set("n", "<leader>5", '5gt')
vim.keymap.set("n", "<leader>6", '6gt')
vim.keymap.set("n", "<leader>7", '7gt')
vim.keymap.set("n", "<leader>8", '8gt')
vim.keymap.set("n", "<leader>9", '9gt')
vim.keymap.set("n", "<leader>0", ':tablast<cr>')

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<F2>", "<cmd>silent :set syntax=on<CR>")
vim.keymap.set("n", "<F3>", "<cmd>silent :set syntax=off<CR>")
