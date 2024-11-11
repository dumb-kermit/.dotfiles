local M = {
	"tanvirtin/monokai.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	require("monokai").setup({})
	require("monokai").setup({ palette = require("monokai").soda })
end

return M
