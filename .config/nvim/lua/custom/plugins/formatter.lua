return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local nls = require("null-ls")
		nls.setup({
			sources = {
				-- all the formatting needed for null-ls
				-- run :NullLsInfo to check which formatter & linter needed for a file type
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.rustfmt,
				nls.builtins.formatting.prettier,
				nls.builtins.formatting.clang_format,
				nls.builtins.formatting.zigfmt,
				-- all the diagnostics needed for null-ls
				nls.builtins.diagnostics.selene,
				-- disable this because eslint really want's a .eslintrc file or else it will complain
				-- nls.builtins.diagnostics.eslint_d
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
