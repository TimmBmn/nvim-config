return {
    { 'nvim-lua/plenary.nvim', lazy=true },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        opts = {},
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", mode="n" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", mode="n" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", mode="n" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>", mode="n" }
        }
    }
}
