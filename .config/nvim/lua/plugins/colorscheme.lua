return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
			},
            palette_overrides = {
                -- this is the variable color highlighting
                light1 = "#f7d883"
            }
		})
		vim.cmd([[colorscheme gruvbox]])
	end,
}
