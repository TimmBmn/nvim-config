return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
		{"hrsh7th/cmp-nvim-lsp-signature-help"},
	},

	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
		  -- see :help lsp-zero-keybindings
		  -- to learn the available actions
		  lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
		  ensure_installed = {},
		  handlers = {
			lsp_zero.default_setup,
		  },
		})

		----------------------------
		local cmp = require('cmp')
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({


			sources = {
				{ name = "nvim_lsp" },
				{ name = 'nvim_lsp_signature_help' }
			},


		  mapping = cmp.mapping.preset.insert({
			-- `Enter` key to confirm completion
			['<CR>'] = cmp.mapping.confirm({select = false}),

			-- Ctrl+Space to trigger completion menu
			['<C-Space>'] = cmp.mapping.complete(),

			-- Navigate between snippet placeholder
			['<C-f>'] = cmp_action.luasnip_jump_forward(),
			['<C-b>'] = cmp_action.luasnip_jump_backward(),

			-- Scroll up and down in the completion documentation
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),
		  }),
		})

	end
}
