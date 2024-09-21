vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>", { silent = true })

-- move lines up and down
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>df", vim.lsp.buf.format)
