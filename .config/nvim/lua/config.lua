-- set map leader here before lazy loads...
vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set default background to dark mode
vim.o.background = "dark"


local options = {
	cursorline = false,
    -- to make the cursor a thick block 
    -- guicursor = ""
	expandtab = true,
	smarttab = true,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	mouse = "a",
	smartindent = true,
	-- because of this when i copy and paste something neovim just automatically indent the way that i dont like
	autoindent = false,

	swapfile = false,
	backup = false,

	hlsearch = false,
	incsearch = true,
	ignorecase = true,
	smartcase = true,

	updatetime = 50,

	splitbelow = true,
	splitright = true,
	wrap = false,
	fileencoding = "utf-8",
	termguicolors = true,
	hidden = true,
	number = true,
	guifont = "iosevka:h17",

	-- to make clipboard support possible,
	clipboard = "unnamedplus",
}

vim.wo.relativenumber = true
-- to make the eol character visible
vim.opt.list = true
vim.opt.listchars:append({ eol = "↵", tab = "   " })

-- some commands i wanted to be able to run
vim.api.nvim_buf_create_user_command(0, "Config", function(_)
	vim.cmd([[e ~/.config/nvim/init.lua]])
end, { desc = "Go to neovim config file." })

for key, value in pairs(options) do
	vim.opt[key] = value
end
