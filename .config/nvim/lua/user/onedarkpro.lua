local M = {
	"olimorris/onedarkpro.nvim",
	event = "UiEnter",
}

function M.config()
	require("onedarkpro").setup({
		options = {
			cursorline = true,
			highlight_inactive_windows = true,
		},
	})
	vim.cmd("colorscheme onedark_dark")
end
return M
