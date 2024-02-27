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

		lsp_zero.on_attach(function(_, bufnr)
		  -- see :help lsp-zero-keybindings
		  -- to learn the available actions
		  lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
		  ensure_installed = {"lua_ls", "pyright"},
		  handlers = {
			lsp_zero.default_setup,
		  },


		  -- fixes the "undefind global "vim"" error but it does it in every
		  -- lua file. So if you every write a lua program watch out!
			require("lspconfig").lua_ls.setup ({
				settings = { Lua = { diagnostics = { globals = {'vim'}}}},
			})


		})

		----------------------------


		-- I do not know what this actually does!
		-- The "sources" table needs to be there to show the function
		-- signature but the rest like <C-n> still work without so idk
		-- if someone reads this and knows what it is please tell me :)
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
