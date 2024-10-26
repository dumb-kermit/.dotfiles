local M = {
	"cesaralvarod/tokyogogh.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("tokyogogh").setup({
		style = "storm", -- storm | night
	})

	vim.cmd([[colorscheme tokyogogh]])
end
return M
