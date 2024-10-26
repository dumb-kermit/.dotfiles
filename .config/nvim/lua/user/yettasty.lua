local M = {
	"patstockwell/vim-monokai-tasty",
	event = "UiEnter",
}

function M.config()
	vim.cmd("let g:vim_monokai_tasty_italic = 1")
	vim.cmd("colorscheme vim-monokai-tasty")
end
return M
