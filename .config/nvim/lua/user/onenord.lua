local M = {
	"rmehri01/onenord.nvim",
	event = "UiEnter",
}

function M.config()
	-- Lua
	require("onenord").setup()
end

return M
