return {
   -- COLORSCHEME #1
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
   -- COLORSCHEME #2
   -- colorscheme i used to use
   --"folke/tokyonight.nvim",
   --config = function()
   --    require("tokyonight").setup {
   --        styles = {
   --            comments = {
   --                italic = false,
   --            },
   --            keywords = {
   --                italic = false,
   --            }
   --        }
   --    }
   --    vim.cmd [[colorscheme tokyonight]]
   --end
   -- COLORSCHEME #3
   "ellisonleao/gruvbox.nvim",
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
