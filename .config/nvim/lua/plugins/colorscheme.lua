return {
   "ellisonleao/gruvbox.nvim",
   -- these are just multiple colorscheme plugins not dependencies needed for gruvbox.nvim,
   -- these reason i need to put other colorscheme into the dependencies field is because, 
   -- if i put a string inside this table that has a string before, lazy.nvim will not allow that to happen.
   dependencies = {
        "Mofiqul/vscode.nvim",
        {
            -- the reason why there is a name field in this colorscheme plugin is to rename a plugin and because lazy.nvim will name this 
            -- whatever the name after `/` sign so the name of this plugins will be nvim. Which is confusinga.
            "catppuccin/nvim",
            name = 'catppuccin',
        },
   },
   config = function()
       require("gruvbox").setup {
           bold = false,
           italic = {
                strings = false,
                comments = false,
           },
       }
       vim.cmd [[colorscheme gruvbox]]
   end,
}
