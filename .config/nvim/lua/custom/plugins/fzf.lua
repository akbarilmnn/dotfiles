return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")

		telescope.setup({})

		telescope.load_extension("fzf")
	end,
}
