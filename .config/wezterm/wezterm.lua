-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(config)

-- bar.apply_to_config(config, {
-- 	position = "top",
-- 	-- modules = {
-- 	-- spotify = {
-- 	-- enabled = true,
-- 	-- },
-- 	-- hostname = {
-- 	-- enabled = false,
-- 	-- },
-- 	-- username = {
-- 	-- enabled = false,
-- 	-- },
-- 	-- },
-- })

config.unix_domains = { {
	name = "unix",
} }
config.default_gui_startup_args = { "connect", "unix" }

config.window_frame = {
	inactive_titlebar_bg = "#1C1B1A",
	active_titlebar_bg = "#1C1B1A",
	inactive_titlebar_fg = "#161618",
	active_titlebar_fg = "#161618",
	inactive_titlebar_border_bottom = "#b1c1e1",
	active_titlebar_border_bottom = "#b1c1e1",
	-- border_left_width = "0.5cell",
	-- border_right_width = "0.5cell",
	-- border_bottom_height = "0.25cell",
	-- border_top_height = "0.25cell",
	-- border_left_color = "purple",
	-- border_right_color = "purple",
	-- border_bottom_color = "purple",
	-- border_top_color = "purple",
	font = wezterm.font({ family = "Versa" }),
	font_size = 17.0,
}

config.colors = {
	tab_bar = {
		background = "#1C1B1A",
		active_tab = {
			bg_color = "#1C1B1A",
			fg_color = "#b1c1e1",
		},
	},
}

config.adjust_window_size_when_changing_font_size = true
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.native_macos_fullscreen_mode = true
config.term = "wezterm"
config.use_resize_increments = true
config.show_tabs_in_tab_bar = false
config.window_background_opacity = 1.00
config.macos_window_background_blur = 42
config.max_fps = 200
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.scrollback_lines = 0

config.foreground_text_hsb = {
	-- hue = 1.0,
	saturation = 1.08,
	brightness = 0.88,
}
config.window_close_confirmation = "NeverPrompt"
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- config.font = wezterm.font_with_fallback({ { family = "PragmataPro Mono Liga kt", weight = "Regular" }, "SF Mono" })
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font_with_fallback({ { family = "PragmataPro Mono Liga", weight = "Regular" }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			{
-- 				family = "PragmataPro Mono Liga",
-- 				weight = "Regular",
-- 				harfbuzz_features = { "calt=1", "ss06=1" },
-- 				italic = false,
-- 			},
-- 			"SF Mono",
-- 		}),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			{
-- 				family = "PragmataPro Mono Liga",
-- 				weight = "Regular",
-- 				harfbuzz_features = { "calt=1", "ss06=1" },
-- 				italic = false,
-- 			},
-- 			"SF Mono",
-- 		}),
-- 	},
-- }
-- config.font_size = 20.00

-- config.font = wezterm.font_with_fallback({ { family = "Berkeley Mono", weight = "Bold" }, "SF Mono" })
-- config.font_size = 18.50
-- config.cell_width = 0.95
-- config.line_height = 0.84

-- config.font = wezterm.font_with_fallback({ { family = "Codelia Ligatures", weight = "Light" }, "SF Mono" })
-- config.font_size = 18.00
-- config.cell_width = 0.95
-- config.line_height = 0.84

-- config.font = wezterm.font_with_fallback({ { family = "JetBrains Mono x" }, "SF Mono" })
-- config.font_size = 19.00
-- config.cell_width = 0.95
-- config.line_height = 0.84

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "AT Name Mono Variable",
-- 		weight = "Medium",
-- 		harfbuzz_features = {
-- 			"calt=1",
-- 			"liga=1",
-- 			"kern=1",
-- 			"ccmp=1",
-- 			"mark=1",
-- 			"mkmk=1",
-- 			"ss13=1",
-- 			"ss14=1",
-- 			"ss16=1",
-- 			"ss05=0",
-- 			"zero=1",
-- 			"case=1",
-- 			"dlig=1",
-- 		},
-- 	},
-- 	"SF Mono",
-- })
-- config.font_size = 20.00
-- config.cell_width = 0.92
-- config.line_height = 0.94

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Lilex",
-- 		weight = "Bold",
-- 		harfbuzz_features = {
-- 			"calt=1",
-- 			"liga=1",
-- 			"kern=1",
-- 			"ccmp=1",
-- 			"mark=1",
-- 			"mkmk=1",
-- 			"ss13=1",
-- 			"ss14=1",
-- 			"ss16=1",
-- 			"ss05=1",
-- 			"zero=1",
-- 			"case=1",
-- 			"dlig=1",
-- 		},
-- 	},
-- 	"SF Mono",
-- })

-- config.font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold" }, "SF Mono" })
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold" }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold", italic = false }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold", italic = false }, "SF Mono" }),
-- 	},
-- }

-- config.font_size = 19.50
-- config.cell_width = 0.96
-- config.line_height = 0.90

-- config.font = wezterm.font_with_fallback({ { family = "X MD IO Trial Medium", weight = "Bold" }, "SF Mono" })
-- config.font = wezterm.font_with_fallback({ { family = "XMDIOTrial Nerd Font Mono", weight = "Bold" }, "SF Mono" })
-- config.font_size = 19.50
-- config.cell_width = 0.98
-- config.line_height = 0.90

-- config.font = wezterm.font_with_fallback({ { family = "XMDIOTrial Nerd Font Mono", weight = "Bold" }, "SF Mono" })
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font_with_fallback({ { family = "XMDIOTrial Nerd Font Mono", weight = "Bold" }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({ { family = "XMDIOTrial Nerd Font Mono", weight = "Bold" }, "SF Mono" }),
-- 	},
-- }

-- config.font = wezterm.font_with_fallback({
-- {
-- family = "Wumpus Mono Pro Medium",
-- weight = "Medium",
-- harfbuzz_features = { "calt=1", "clig=1", "liga=1", "ss01=1" },
-- },
-- "SF Mono",
-- })
-- config.font_size = 20.0
-- config.cell_width = 0.96
-- config.line_height = 0.90

-- config.font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold" }, "SF Mono" })
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold" }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold", italic = false }, "SF Mono" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({ { family = "Lilex", weight = "Bold", italic = false }, "SF Mono" }),
-- 	},
-- }
-- config.font_size = 20.0
-- config.cell_width = 0.96
-- config.line_height = 0.94

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Berkeley Mono",
-- 		weight = "Bold",
-- 		-- harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font_size = 20.00
-- config.cell_width = 1.00
-- config.line_height = 1.00

-- config.font = wezterm.font_with_fallback({ { family = "TTAutonomousMono Nerd Font", weight = "Bold" }, "SF Mono" })
-- config.font_size = 19.00
-- config.cell_width = 0.94
-- config.line_height = 0.82

-- config.font = wezterm.font_with_fallback({ { family = "Rec Mono xlin800", weight = "Bold" }, "SF Mono" })
-- config.font_size = 20.0
-- config.cell_width = 1.00
-- config.line_height = 1.00

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Cartograph CF",
-- 		weight = "Thin",
-- 		harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font_size = 18.0
-- config.cell_width = 0.92
-- config.line_height = 0.72

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "XMDIOTrial Nerd Font Mono",
-- 		weight = "Bold",
-- 		-- harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font_size = 20.0
-- config.cell_width = 0.98
-- config.line_height = 0.94

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono C700",
-- 		-- weight = "Thin",
-- 		-- harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono LCC540",
-- 		weight = "Regular",
-- 		-- harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono V15_580",
-- 		weight = "Regular",
-- 		-- harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font_size = 17.50
-- config.cell_width = 1.00
-- config.line_height = 1.00

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono a3368",
-- 		weight = "Bold",
-- 		harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })

-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono CF360",
-- 		weight = "Bold",
-- 		harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })
-- config.font = wezterm.font_with_fallback({
-- 	{
-- 		family = "Rec Mono X300",
-- 		weight = "Bold",
-- 		harfbuzz_features = { "calt=1", "liga=1", "ccmp=1", "ss03=1", "ss04=1" },
-- 	},
-- 	"SF Mono",
-- })

-- config.font = wezterm.font_with_fallback({ { family = "Wumpus Mono Pro Medium" }, "SF Mono" })
-- config.font_size = 17.50
-- config.cell_width = 0.98
-- config.line_height = 0.90

config.font = wezterm.font_with_fallback({ { family = "XIBMPlexMono Nerd Font Mono", weight = "Bold" }, "SF Mono" })
config.font_size = 19.00
config.cell_width = 0.94
config.line_height = 0.94

-- config.font = wezterm.font_with_fallback({{ family = 'MonoLisa', weight = "Black", harfbuzz_features = { 'ss03=1', 'calt=1', 'liga=1', 'kern=1', 'ccmp=1', 'mark=1', 'mkmk=1', 'ss06=1', 'ss05=1', 'ss07=1', 'ss10=1', 'ss08=1', 'ss02=1', 'ss15=1', 'ss17=1', 'ss13=1', 'ss11=1', 'ss01=1', 'ss04=1', 'ss14=1', 'zero=1', 'case=1', 'dlig=1' } }, 'SF Mono'})
-- config.font_size = 18.50
-- config.cell_width = 1.0
-- config.line_height = 0.9

config.bold_brightens_ansi_colors = "BrightOnly"
config.freetype_load_flags = "FORCE_AUTOHINT"
config.freetype_load_target = "Light"
-- config.freetype_render_target = "HorizontalLcd"
config.freetype_render_target = "Normal"

-- config.color_scheme = "flexoki-dark"
-- config.color_scheme = "PaperColor Dark (base16)"
-- config.color_scheme = 'Modus-Vivendi-Tritanopia'
-- config.color_scheme = "Monokai Dark (Gogh)"
-- config.color_scheme = "Monokai Pro (Gogh)"
-- config.color_scheme = "Monokai Pro Ristretto (Gogh)"
-- config.color_scheme = "Monokai Soda"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Papercolor Dark (Gogh)"
-- config.color_scheme = "Frontend Delight (Gogh)"
-- config.color_scheme = "Sonokai (Gogh)"
-- config.color_scheme = "Gruvbox Material (Gogh)"
config.color_scheme = "tokyonight_day"
-- config.color_scheme = "Gruvbox Dark (Gogh)"
-- config.color_scheme = "Hardcore (Gogh)"
-- config.color_scheme = "Gruber (base16)"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Hybrid (Gogh)"
-- config.color_scheme = "Atelier Sulphurpool (base16)"
-- config.color_scheme = "Atelier Savanna (base16)"
-- config.color_scheme = "Arthur (Gogh)"
-- config.color_scheme = "Afterglow (Gogh)"
-- config.color_scheme = "Srcery (Gogh)"

wezterm.on("update-status", function(window, pane)
	local meta = pane:get_metadata() or {}
	if meta.is_tardy then
		local secs = meta.since_last_response_ms / 1000.0
		window:set_right_status(string.format("tardy: %5.1fs⏳", secs))
	end
end)

-- and finally, return the configuration to wezterm
return config
