local M = {
	"echasnovski/mini.statusline",
	event = "UiEnter",
}

function M.config()
	vim.g.qf_disable_statusline = 1
	vim.opt.laststatus = 3
	vim.o.showmode = false
	require("mini.statusline").setup()
end

return M
