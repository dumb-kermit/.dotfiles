local M = {
	"eldritch-theme/eldritch.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd([[colorscheme eldritch]])
end

return M
