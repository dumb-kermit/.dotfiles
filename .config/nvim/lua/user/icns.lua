local M = {
	"echasnovski/mini.icons",
	version = false,
	-- cmd = "Telescope",
	-- event = "VeryLazy",
}

function M.config()
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()
end

return M
