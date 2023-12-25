return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
        local configs = require("nvim-treesitter.configs");

        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "javascript",
                "typescript",
                "html",
                "css",
                "cpp",
                "zig",
                "rust",
                "markdown",
                "markdown_inline"
            },
            highlight = { enable = true },
            ident = { enable = true  },
        })

    end
}
