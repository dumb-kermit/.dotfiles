local M = {
	"briones-gabriel/darcula-solid.nvim",
	dependencies = "rktjmp/lush.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme darcula-solid")
	vim.cmd("hi StatusLine guibg=none guifg=#FFC66B")
end
return M
