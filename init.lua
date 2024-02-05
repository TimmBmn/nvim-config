vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true

-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Show bottom and top lines when scrolling
vim.opt.scrolloff = 10

vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>")

require("config.lazy")
