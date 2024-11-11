local M = {
	"echasnovski/mini.icons",
	version = false,
	-- cmd = "Telescope",
	-- event = "VeryLazy",
}

function M.config()
	require("mini.icons").setup()
	-- MiniIcons.mock_nvim_web_devicons()
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end
end

return M
