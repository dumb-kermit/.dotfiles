require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!-- Make line numbers default
vim.opt.number = true
-- You can add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true 

vim.cmd.amenu([[PopUp.Inspect <Cmd>Inspect<CR>]])
vim.cmd.amenu([[PopUp.Telescope <Cmd>Telescope<CR>]])

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = "no"

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 10
vim.opt.showtabline = 1

vim.opt.fillchars = { eob = ' ' }
vim.opt.guicursor = {
	"n-v:block-Cursor/Cursor",
	"i-c-ci-ve:hor50",
	"r-cr:hor20",
	"o:hor50",
	"n:blinkwait1-blinkoff200-blinkon200",
	"i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.opt.smoothscroll = true

vim.cmd("let base16colorspace=256")
vim.cmd("set syntax=on")
vim.o.wrap = false
vim.o.foldcolumn = "0"
vim.o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.statuscolumn = "%=%l%s%C┃"

-- Fatter Winbar
vim.opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.1
vim.o.linespace = -6

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.expandtab = true
vim.o.tabstop = 4

vim.o.scrolloff = 0

vim.o.shiftwidth = 4

vim.o.virtualedit = "block"

vim.o.mousemodel = "extend"
vim.o.cursorlineopt = "number"

vim.o.cmdheight = 0
