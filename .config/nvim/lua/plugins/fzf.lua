return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    cmd = "Telescope",
    config = function()
        require("telescope").setup {
            pickers = { 
                colorscheme = {
                    enable_preview = true,
                    theme = "dropdown",
                },
            }
        }
    end
}
