vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>", { silent = true })
