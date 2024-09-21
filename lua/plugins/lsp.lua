return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim", opts = {} },
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    { "hrsh7th/cmp-nvim-lsp-signature-help" },
                    { "hrsh7th/cmp-buffer" },
                    { "hrsh7th/cmp-path" },
                    { "hrsh7th/cmp-cmdline" }
                },
                config = function()
                    local cmp = require("cmp")
                    cmp.setup({
                        sources = {
                            { name = "nvim_lsp" },
                            { name = "nvim_lsp_signature_help" },
                            { name = "buffer" },
                            { name = "path" }
                        },
                        mapping = cmp.mapping.preset.insert({
                            -- these are the only two i am actively using right now
                            -- in the future i'll probably add the scrolling through docs
                            -- but for now its enough
                            ['<C-Space>'] = cmp.mapping.complete(),
                            ['<CR>'] = cmp.mapping.confirm({ select = false }),
                            --['<C-b>'] = cmp.mapping.scroll_docs(-4),
                            --['<C-f>'] = cmp.mapping.scroll_docs(4),
                            --['<C-e>'] = cmp.mapping.abort(),
                        }),
                    })

                    cmp.setup.cmdline({ "/", "?" }, {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = {
                            { name = "buffer" },
                        }
                    })

                    cmp.setup.cmdline(":", {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = {
                            { name = "path" },
                            { name = "cmdline" }
                        }
                    })
                end,
            },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
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
        end,
    }
}
