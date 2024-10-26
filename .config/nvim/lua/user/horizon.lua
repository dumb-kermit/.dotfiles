local M = {
	"lunarvim/horizon.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=light")
	vim.cmd.colorscheme("horizon")
	-- vim.cmd("hi Normal guibg=#0e0e0e")
end
return M
