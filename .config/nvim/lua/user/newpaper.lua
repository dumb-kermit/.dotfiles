local M = {
	"yorik1984/newpaper.nvim",
	event = "UiEnter",
}

function M.config()
	require("newpaper").setup({
		style = "light",
	})
end
return M
