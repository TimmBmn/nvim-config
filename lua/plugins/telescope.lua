return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
    opts = {},
    keys = {
        { "<leader>ff", require("telescope.builtin").find_files, mode="n" },
        { "<leader>fg", require("telescope.builtin").live_grep, mode="n" },
        { "<leader>fb", require("telescope.builtin").buffers, mode="n" },
        { "<leader>gs", require("telescope.builtin").git_status, mode="n" }
    }
}
