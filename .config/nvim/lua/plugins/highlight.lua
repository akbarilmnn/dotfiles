return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vim",
                "c",
                "cpp",
                "zig",
                "rust",
                "javascript",
                "typescript",
                "html",
                "css",
                "lua"
            }
        })
    end,
    build = ":TSUpdate",
}
