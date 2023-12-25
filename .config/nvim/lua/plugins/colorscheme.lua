return {
	"folke/tokyonight.nvim",
	dependencies = {
		"phha/zenburn.nvim",
	},
	priority = 1000,
	config = function()
        vim.cmd([[colorscheme tokyonight-night]])
	end,
}
