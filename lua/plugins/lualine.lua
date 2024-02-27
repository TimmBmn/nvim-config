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


		local function getFileName()
			local bufnr = vim.fn.bufnr()
			local bufname = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":t")
			local bufstatus = vim.fn.getbufvar(bufnr, "&modified")

			return bufname .. (bufstatus ~= 0 and " •" or "")
		end

		local function gitblameShowCondition()
			return git_blame.is_blame_text_available() and git_blame.get_current_blame_text() ~= nil
		end


		require("lualine").setup({
			sections = {
				lualine_a = {"mode"},
				lualine_b = {"branch", "diff", "diagnostics"},
				lualine_c = {{getFileName}},

				lualine_x = {{git_blame.get_current_blame_text, cond = gitblameShowCondition}},
				lualine_y = {"encoding", "fileformat"},
				lualine_z = {"location"},
			}
		})
	end
}
