return {
	"folke/tokyonight.nvim",
	opts = {
		require("tokyonight").setup({
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		}),
	},
}
