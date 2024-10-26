local M = {
	"echasnovski/mini.map",
	version = false,
	event = "BufReadPost",
}

function M.config()
	require("mini.map").setup()
end
return M
