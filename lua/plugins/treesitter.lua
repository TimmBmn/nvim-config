return {
	"nvim-treesitter/nvim-treesitter",

	-- updates highlighters on startup
	build = ":TSUpdate",

	-- starts with specificed options below
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,

	opts = {

		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		highlight = {
			enable = true,
		},
	},
}
