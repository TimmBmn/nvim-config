return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- not quite sure if this is ok to do, because it would set the keymap for every new
        -- buffer it attaches to and i only really need it the first time it loads but it works
        on_attach = function()
            local gitsigns = require("gitsigns")
            vim.keymap.set("n", "<leader>gbl", gitsigns.blame_line)
            vim.keymap.set("n", "<leader>gba", gitsigns.blame)
        end
    }
}
