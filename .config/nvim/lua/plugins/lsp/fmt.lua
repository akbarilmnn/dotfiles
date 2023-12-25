return {
	"stevearc/conform.nvim",
	event = { "BufWritePost" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- can be a string, tabel or even a function.
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout = 500,
			},
		})
	end,
}
