return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup {}
        require("mason-lspconfig").setup {
            -- TODO: install the formatter automatically
            ensure_installed = {
                -- formatter = stylua
                "lua_ls",
                -- formatter = rustfmt 
                "rust_analyzer",
                -- formatter = clang-format
                "zls",
                "clangd",
                -- formatter = prettier 
                "tsserver"
            }
        }

    end
}
