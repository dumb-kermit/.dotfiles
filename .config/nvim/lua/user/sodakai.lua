local M = {
	"tanvirtin/monokai.nvim",
	event = "UiEnter",
}

function M.config()
	require("monokai").setup({})
	require("monokai").setup({ palette = require("monokai").classic })
end

return M
