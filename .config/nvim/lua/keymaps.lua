---@diagnostic disable: unused-function
local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- TODO: make a helper function to make easier keymaps with description

local set_keymap = function(mode,key_bindings,cmd,desc)
    vim.api.nvim_set_keymap(mode,key_bindings,cmd, {
        noremap = true,
        silent = true,
        desc = desc,
    })
end

-- save
set_keymap('n', '<leader>s', '<cmd>w<CR>', "shortcut to save a file")
-- save and quit
set_keymap('n', '<leader>q', '<cmd>wq<CR>', "shortcut to save and quit a file")
-- go to visual mode easily
set_keymap('n', '<leader>v', '<C-v>', "short to go to visual mode")
-- just quit
set_keymap('n', '<leader>e', ':q!<CR>', "shortcut to quit without saving anything")

set_keymap('n', "<Tab>", "<cmd>BufferLineCycleNext<cr>", "go to the next buffer")
set_keymap('n', "<leader>x", "<cmd>bdelete<cr>", "go to the next buffer")

set_keymap('i', 'jj', '<Esc>', "shortcut to normal mode")
set_keymap('i', 'jk', '<Esc>:',"shortcut to command mode")

-- toggle buffers
set_keymap('n', '<C-n>', '<cmd>bNext<CR>', "go to the next buffer")
set_keymap('n', '<C-b>', '<cmd>bprevious<CR>', "go to the previous buffer")

-- can move blocks of code by using visua mode
set_keymap("v", "J", ":m '>+1<CR>gv=gv", "move a block of code up")
set_keymap("v", "K", ":m '<-2<CR>gv=gv", "move a block of code down")


-- visual mode
set_keymap('v', "<", "<gv", "move a block of code into the left")
set_keymap('v', ">", ">gv", " move a block of code into the right")


-- telescope keymaps 
-- telescope
set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "find files within current working directory respects, .gitignore")
set_keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", "find string in current working directory as you type")
set_keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", "find string under cursor in current working directory")
set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "list open buffers in current neovim instance")
set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "list available help help_tags")




