local M = {
	"AlexvZyl/nordic.nvim",
	event = "UiEnter",
}

function M.config()
	require("nordic").load()
end
return M
