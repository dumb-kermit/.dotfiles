local M = {
	"NTBBloodbath/doom-one.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme doom-one")
end
return M
