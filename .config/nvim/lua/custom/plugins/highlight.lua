return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			ensure_installed = {
				"vim",
				"c",
				"cpp",
				"zig",
				"rust",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
				"markdown",
				"markdown_inline",
			},
		})
	end,
	build = ":TSUpdate",
}
