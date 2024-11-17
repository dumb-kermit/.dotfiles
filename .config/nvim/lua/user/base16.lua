local M = {
	"RRethy/base16-nvim",
	event = "UiEnter",
	-- opts = {
	-- 	vim.cmd("hi Comment guifg=#b4b5b6"),
	-- 	vim.cmd("hi NonText guibg=#DBDBDB guifg=#DBDBDB"),
	-- 	vim.cmd("hi CursorLine guibg=#c4c5c6"),
	-- 	vim.cmd("hi StatusLine guibg=#DBDBDB guifg=#10668B"),
	-- },
}

function M.config()
	-- vim.cmd("colorscheme base16-codeschool")

	vim.cmd("colorscheme base16-shadesmear-light")
	-- vim.cmd("hi Comment guifg=#b4b5b6")
	-- vim.cmd("hi NonText guibg=#DBDBDB guifg=#DBDBDB")
	-- vim.cmd("hi CursorLine guibg=#c4c5c6")
	-- vim.cmd("hi StatusLine guibg=#DBDBDB guifg=#10668B")

	-- vim.cmd("colorscheme base16-shadesmear-dark")
	-- vim.cmd("hi StatusLine guifg=#d7ab54 guibg=#232323")
	-- vim.cmd("hi EndOfBuffer guifg=#232323")
	-- vim.cmd("hi Comment guifg=#404040")
	-- vim.cmd("hi TSComment guifg=#404040")
	-- vim.cmd("hi CursorLineNR guifg=#71983b")

	-- vim.cmd "colorscheme base16-gruvbox-dark-pale"
	-- vim.cmd "hi EndOfBuffer guifg=#202746"
	-- vim.cmd "hi CursorLineNR guifg=#C08B30 guibg=#202746"
	-- vim.cmd "hi StatusLine guifg=#C94922 guibg=#202746"
	-- vim.cmd "hi TSString guifg=#C08B30 cterm=italic gui=italic"
	-- vim.cmd "hi String guifg=#C08B30 cterm=italic gui=italic"
	-- vim.cmd "hi TSType guifg=#C08B30 cterm=italic gui=italic"
	-- vim.cmd "hi Comment guifg=#4B5374 cterm=italic gui=italic"
	-- vim.cmd "hi Function guifg=#6679CC cterm=italic gui=italic"
	-- vim.cmd "hi TSKeywordFunction guifg=#6679CC cterm=italic gui=italic"
	-- vim.cmd "hi @keyword.function.lua guifg=#6679CC cterm=italic gui=italic"
	-- vim.cmd "hi TSProperty guifg=#979DB4 cterm=italic gui=italic"
	-- vim.cmd "hi Property guifg=#979DB4 cterm=italic gui=italic"
end
return M
