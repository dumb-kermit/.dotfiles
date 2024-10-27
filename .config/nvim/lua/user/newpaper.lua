local M = {
	"yorik1984/newpaper.nvim",
	event = "UiEnter",
}

function M.config()
	require("newpaper").setup({
		style = "dark",
	})
end
return M
