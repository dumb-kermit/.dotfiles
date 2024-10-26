local M = {
	"wuelnerdotexe/vim-enfocado",
	event = "UiEnter",
}

function M.config()
	vim.g.enfocado_style = "neon"
	vim.cmd("colorscheme enfocado")
end
return M
