local M = {
	"briones-gabriel/darcula-solid.nvim",
	dependencies = "rktjmp/lush.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme darcula-solid")
end
return M
