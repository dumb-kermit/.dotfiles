local M = {}

M.ui = {
	theme = "dark_horizon",
	-- theme = "dark_horizon",
	-- transparency = true,

	telescope = { style = "borderless" }, -- borderless / bordered

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
	},

	statusline = {
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "round",
		order = nil,
		modules = nil,
	},

	tabufline = {
		enabled = false,
		lazyload = true,
		order = { "treeOffset", "buffers", "tabs", "btns" },
		modules = nil,
	},

	nvdash = {
		load_on_startup = true,
	},
	hl_override = {
		-- ["@operator"] = { fg = "#df6656" },
		["@keyword.function"] = { link = "Type" },
		Comment = { italic = true },
		-- Boolean = { fg = "#d38ebd" },
		MiniIndentscopeSymbol = { link = "Comment" },
		EndOfBuffer = { link = "Nontext" },
		-- CursorLineNr = { fg = "#F8520E" },
		FoldColumn = { bg = "#222222" },
		["@comment"] = { italic = true },
		["@operator"] = { italic = true },
		["@variable"] = { italic = true },
		["Boolean"] = { underline = true },
		["@number"] = { italic = true },
	},
}

M.base46 = {
	integrations = {
		"blankline",
		"стр",
		"defaults",
		"devicons",
		"git",
		"Isp",
		"mason",
		"nvcheatsheet",
		"nvdash",
		"nvimtree",
		"statusline",
		"syntax",
		"treesitter",
		"tbline",
		"telescope",
		"whichkey",
	},
}

return M
