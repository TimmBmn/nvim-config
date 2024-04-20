vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>")
vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>pp", vim.cmd.Ex)
