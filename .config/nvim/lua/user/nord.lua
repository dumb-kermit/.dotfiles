local M = {
	"gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("nord").setup({})
	vim.cmd.colorscheme("nord")
end

return M
