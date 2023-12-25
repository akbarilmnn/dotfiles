return {
	"mfussenegger/nvim-lint",
	event = {
		"BufWritePost",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			cpp = { "cpplint" },
			c = { "cpplint" },
		}

		local group = vim.api.nvim_create_augroup("linters", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
