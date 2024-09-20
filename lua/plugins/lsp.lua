return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim", opts = {} },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function ()

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = cmp_nvim_lsp.default_capabilities()
                })
            end,
        })
    end
}
