local M = {
	"echasnovski/mini.base16",
	version = false,
	event = "UiEnter",
}

function M.config()
	require("mini.base16").setup({
		palette = {
			base00 = "#060C14",
			base01 = "#1e242b",
			base02 = "#373c42",
			base03 = "#50545a",
			base04 = "#b1c1e1",
			base05 = "#e6e6e7",
			base06 = "#cdced0",
			base07 = "#b4b6b8",
			base08 = "#e6e6e7",
			base09 = "#d83d00",
			base0A = "#8D9742",
			base0B = "#46a436",
			base0C = "#BE95FF",
			base0D = "#E06C75",
			base0E = "#0CA2AF",
			base0F = "#3760bf",
		},
		use_cterm = false,
		plugins = {
			default = true,
		},
	})
end
return M
