local M = {
	"kartikp10/noctis.nvim",
	dependencies = "rktjmp/lush.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("syntax on")
	vim.cmd("colorscheme noctis_bordo")
end
return M
