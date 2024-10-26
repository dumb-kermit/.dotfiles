local M = {
	"drybalka/clean.nvim",
	priority = 1000,
	lazy = false,
}

function M.config()
	require("clean").clean_plugins()
end
return M
