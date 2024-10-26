local M = {
	"echasnovski/mini.animate",
	version = false,
	event = "BufReadPost",
}

function M.config()
	require("mini.animate").setup()
end
return M
