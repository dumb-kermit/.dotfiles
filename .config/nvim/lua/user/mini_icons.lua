local M = {
	"echasnovski/mini.icons",
	version = false,
	event = "UiEnter",
}

function M.config()
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()
end
return M
