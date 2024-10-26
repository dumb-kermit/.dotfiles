local M = {
	"echasnovski/mini.hues",
	version = false,
	event = "UiEnter",
}

function M.config()
	require("mini.hues").setup({
		-- **Required** base colors as '#rrggbb' hex strings
		background = "#080812",
		foreground = "#a8c8b8",

		-- Number of hues used for non-base colors
		n_hues = 8,

		-- Saturation level. One of 'low', 'medium', 'high'.
		saturation = "low",

		-- Accent color. One of: 'bg', 'fg', 'red', 'orange', 'yellow', 'green',
		-- 'cyan', 'azure', 'blue', 'purple'
		accent = "orange",

		-- Plugin integrations. Use `default = false` to disable all integrations.
		-- Also can be set per plugin (see |MiniHues.config|).
		plugins = { default = true },
	})
end
return M
