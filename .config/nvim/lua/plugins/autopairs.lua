return {
	"windwp/nvim-autopairs",
	dependencies = {
		-- use tresitter to auto close and auto rename html tags
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-ts-autotag").setup({})
		require("nvim-autopairs").setup({})
	end,
}
