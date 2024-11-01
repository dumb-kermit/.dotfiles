local M = {
	"vv9k/bogster",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme bogster")
end
return M
