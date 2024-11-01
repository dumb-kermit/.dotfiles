local M = {
	"alexmozaidze/palenight.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd.colorscheme("palenight")
end
return M
