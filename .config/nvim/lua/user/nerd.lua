local M = {
	"glepnir/galaxyline.nvim",
	event = "UiEnter",
	-- dependencies = "Avimitin/nerd-galaxyline",
}

function M.config()
	require("user.nerdline")
end
return M
