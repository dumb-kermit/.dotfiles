local M = {
	"talha-akram/noctis.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme noctis")
end
return M
