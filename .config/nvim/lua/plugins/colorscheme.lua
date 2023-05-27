return {
   -- colorscheme i used to use
   -- "rebelot/kanagawa.nvim",
   -- config = function() 

   --     -- some additional configuration 
   --     require("kanagawa").setup({
   --         commentStyle = {
   --             italic = false
   --         }
   --     })

   --     -- initialize the colorscheme
   --     vim.cmd("colorscheme kanagawa")
   -- end, 
   "folke/tokyonight.nvim",
   config = function()
       require("tokyonight").setup {
           styles = {
               comments = {
                   italic = false,
               },
               keywords = {
                   italic = false,
               }
           }
       }
       vim.cmd [[colorscheme tokyonight-night]]
   end
}
