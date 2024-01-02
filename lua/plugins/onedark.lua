return {
	-- define colorscheme
	"navarasu/onedark.nvim",

	-- configure colorscheme
	config = function()
		require("onedark").setup {
			style = "deep"
		}
		require("onedark").load()
	end
}
