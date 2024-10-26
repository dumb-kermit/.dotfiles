local M = {
	"gantoreno/nvim-gabriel",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme gabriel")
end
return M
