return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		"f-person/git-blame.nvim"
	},

	config = function()

		vim.g.gitblame_display_virtual_text = 0
		vim.g.gitblame_date_format="%r"
		vim.g.gitblame_message_template = '<author> (<date>)'
		local git_blame = require("gitblame")


		local function gitblameShowCondition()
			return git_blame.is_blame_text_available() and git_blame.get_current_blame_text() ~= nil
		end

		require("lualine").setup({
			sections = {
				lualine_c = {
					{ git_blame.get_current_blame_text, cond = gitblameShowCondition}
				}
			}
		})


	end
}
