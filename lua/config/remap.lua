vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>", { silent = true })
vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>pp", ":Ex<CR>", { silent = true })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

--  is <C-#> but that cant be bount cause it results to  
vim.keymap.set("n", "", ":CommentToggle<CR>", { silent = true })
vim.keymap.set("v", "", ":'<,'>CommentToggle<CR>gv", { silent = true })
