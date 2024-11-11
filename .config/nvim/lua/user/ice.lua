local M = {
	"cocopon/iceberg.vim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=light")
	vim.cmd("colorscheme iceberg")
end
return M
