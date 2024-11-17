local M = {
	"loctvl842/monokai-pro.nvim",
	event = "UiEnter",
}

function M.config()
	require("monokai-pro").setup({
		transparent_background = false,
		terminal_colors = true,
		devicons = true, -- highlight the icons of `nvim-web-devicons`
		styles = {
			comment = { italic = true },
			keyword = { italic = true }, -- any other keyword
			type = { italic = true }, -- (preferred) int, long, char, etc
			--    storageclass = { italic = true }, -- static, register, volatile, etc
			--    structure = { italic = true }, -- struct, union, enum, etc
			--    parameter = { italic = true }, -- parameter pass in function
			--    annotation = { italic = true },
			--    tag_attribute = { italic = true }, -- attribute of tag in reactjs
		},
		filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
		-- Enable this will disable filter option
		day_night = {
			enable = false, -- turn off by default
			day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
		},
		inc_search = "underline", -- underline | background
		background_clear = {
			"float_win",
			"toggleterm",
			"telescope",
			"which-key",
			"renamer",
			"notify",
			-- "nvim-tree",
			-- "neo-tree",
			-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
		}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
		plugins = {
			bufferline = {
				underline_selected = false,
				underline_visible = false,
			},
			indent_blankline = {
				context_highlight = "default", -- default | pro
				context_start_underline = false,
			},
		},
		--- @param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
		-- override = function(c)
		-- 	return {
		-- 		IndentBlanklineChar = { fg = c.base.dimmed4 },
		-- 	}
		-- end,
		-- overridePalette = function(filter)
		-- 	return {
		-- 		dark2 = "#101014",
		-- 		dark1 = "#16161E",
		-- 		background = "#1A1B26",
		-- 		text = "#C0CAF5",
		-- 		accent1 = "#f7768e",
		-- 		accent2 = "#7aa2f7",
		-- 		accent3 = "#e0af68",
		-- 		accent4 = "#9ece6a",
		-- 		accent5 = "#0DB9D7",
		-- 		accent6 = "#9d7cd8",
		-- 		dimmed1 = "#737aa2",
		-- 		dimmed2 = "#787c99",
		-- 		dimmed3 = "#363b54",
		-- 		dimmed4 = "#363b54",
		-- 		dimmed5 = "#16161e",
		-- 	}
		-- end,
		-- - @param filter "classic" | "machine" | "octagon" | "pro" | "ristretto" | "spectrum"
		-- override = function(c)
		-- return {
		-- IndentBlanklineChar = { fg = c.base.dimmed4 },
		-- }
		-- end,
		-- overridePalette = function(filter)
		-- return {
		-- dark2 = "#101014",
		-- dark1 = "#16161E",
		-- background = "#1A1B26",
		-- text = "#C0CAF5",
		-- accent1 = "#f7768e",
		-- accent2 = "#7aa2f7",
		-- accent3 = "#e0af68",
		-- accent4 = "#9ece6a",
		-- accent5 = "#0DB9D7",
		-- accent6 = "#9d7cd8",
		-- dimmed1 = "#737aa2",
		-- dimmed2 = "#787c99",
		-- dimmed3 = "#363b54",
		-- dimmed4 = "#363b54",
		-- dimmed5 = "#16161e",
		-- }
		-- end,
		-- return {
		-- accent1 = "#0074BC",
		-- accent2 = "#FF2500",
		-- accent3 = "#FF6400",
		-- accent4 = "#565745",
		-- accent5 = "#00A6A7",
		-- dimmed5 = "#585858",
		-- accent6 = "#FF004C",
		-- dark2 = "#1A1A1A",
		-- dark1 = "#16161E",
		-- text = "#b1c1e1",
		-- background = "#1B1C1D",

		-- background = "#202021",
		-- accent2 = "#B87EFF",
		-- accent1 = "#E33300",
		-- accent3 = "#00A798",
		-- accent4 = "#0090D8",
		-- accent5 = "#C08000",
		-- dimmed5 = "#585858",
		-- accent6 = "#7D9A00",
		-- dark2 = "#1A1A1A",
		-- dark1 = "#16161E",
		-- text = "#b1c1e1",

		-- background = "#1A1A1A",
		-- text = "#bebebe",
		-- accent1 = "#F4005F",
		-- accent2 = "#808080",
		-- accent3 = "#FA8419",
		-- accent4 = "#98E024",
		-- accent5 = "#58D1EB",
		-- accent6 = "#9D65FF",
		-- dimmed1 = "#625E4C",
		-- dimmed2 = "#7A8094",
		-- dimmed3 = "#7A8094",
		-- dimmed4 = "#7A8094",
		-- dimmed5 = "#1A1A1A",
		-- 		dark2 = "#252019",
		-- 		dark1 = "#292423",
		-- 		background = "#272221",
		-- 		text = "#bebebe",
		-- 		accent1 = "#FF5187",
		-- 		accent2 = "#F6D687",
		-- 		accent3 = "#FF5D35",
		-- 		accent4 = "#38DCE8",
		-- 		accent5 = "#00C2B0",
		-- 		accent6 = "#DA9ECD",
		-- 		dimmed1 = "#9AA0A4",
		-- 		dimmed2 = "#7A8094",
		-- 		dimmed3 = "#7A8094",
		-- 		dimmed4 = "#7A8094",
		-- 		dimmed5 = "#1A1A1A",
		-- 		dark2 = "#101014",
		-- 		dark1 = "#16161E",
		-- 		background = "#1A1B26",
		-- 		text = "#C0CAF5",
		-- 		accent1 = "#f7768e",
		-- 		accent2 = "#7aa2f7",
		-- 		accent3 = "#e0af68",
		-- 		accent4 = "#9ece6a",
		-- 		accent5 = "#0DB9D7",
		-- 		accent6 = "#9d7cd8",
		-- 		dimmed1 = "#737aa2",
		-- 		dimmed2 = "#787c99",
		-- 		dimmed3 = "#363b54",
		-- 		dimmed4 = "#363b54",
		-- 		dimmed5 = "#16161e",
		-- dark2 = "#101014",
		-- dark1 = "#16161E",
		-- background = "#1A1A1A",
		-- text = "#bebebe",
		-- accent1 = "#F4005F",
		-- accent2 = "#EBDA62",
		-- accent3 = "#FA8419",
		-- accent4 = "#98E024",
		-- accent5 = "#58D1EB",
		-- accent6 = "#9D65FF",
		-- dimmed1 = "#9AA0A4",
		-- dimmed2 = "#7A8094",
		-- dimmed3 = "#7A8094",
		-- dimmed4 = "#7A8094",
		-- dimmed5 = "#1A1A1A",
		-- }
		-- end,
		overrideScheme = function(cs, p, config, hp)
			local cs_override = {}
			local calc_bg = hp.blend(p.background, 0.75, "#000000")

			cs_override.editor = {
				background = calc_bg,
			}
			return cs_override
		end,
		-- -- ---@param c Colorscheme
		-- override = function(c) end,
		-- ---@param cs Colorscheme
		-- ---@param p ColorschemeOptions
		-- ---@param Config MonokaiProOptions
		-- ---@param hp Helper
		-- -- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper)
		-- end
	})

	vim.cmd("colorscheme monokai-pro")
end

return M
