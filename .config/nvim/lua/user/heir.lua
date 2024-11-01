local M = {
	"rebelot/heirline.nvim",
	event = "UiEnter",
}

function M.config()
	vim.g.qf_disable_statusline = 1
	vim.opt.laststatus = 3
	vim.o.showmode = false
	require("heirstl")
	-- require("user.heirl")
end
return M
