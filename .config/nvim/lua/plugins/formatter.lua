return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local nls = require("null-ls")
        nls.setup {
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
                nls.builtins.diagnostics.eslint_d
            }
        }
    end
}
