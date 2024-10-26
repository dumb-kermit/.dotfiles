local M = {
	"savq/melange-nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme melange")
	vim.cmd("hi EndOfBuffer guifg=#292522")
end
return M
