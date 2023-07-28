return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			bold = false,
			italic = {
				strings = false,
				comments = false,
			},
		})
		vim.cmd([[colorscheme gruvbox]])
	end,
}
