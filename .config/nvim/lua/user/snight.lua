local M = {
	"rhysd/vim-color-spring-night",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme spring-night")
end
return M
