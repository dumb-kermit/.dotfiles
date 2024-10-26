local M = {
	"polirritmico/monokai-nightasty.nvim",
	event = "UiEnter",
}

function M.config()
	local opts = {
		dark_style_background = "#040412", -- default, dark, transparent, #color
		light_style_background = "default", -- default, dark, transparent, #color
		hl_styles = {
			-- Style to be applied to selected syntax groups: (See `:help nvim_set_hl` for supported keys)
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true },
			variables = { italic = true },
			-- Background styles for sidebars (panels) and floating windows:
			floats = "default", -- default, dark, transparent
			sidebars = "default", -- default, dark, transparent
		},
		color_headers = true,
		markdown_header_marks = true,
		cache = true,
		auto_enable_plugins = true,
	} -- options should be setted through a setup call:
	require("monokai-nightasty").setup(opts) -- ...and then load the theme:
	require("monokai-nightasty").load()
end
return M
