-- Eviline config for lualine
-- Author: sadgrog
local lualine = require("lualine")

-- Color table for highlights
-- local colors = require("theme").colors

-- local colors = {
-- red = require("base16-colorscheme").colors.base08,
-- yellow = require("base16-colorscheme").colors.base0A,
-- green = require("base16-colorscheme").colors.base0B,
-- cyan = require("base16-colorscheme").colors.base0C,
-- blue = require("base16-colorscheme").colors.base0D,
-- purple = require("base16-colorscheme").colors.base0E,
-- gray = require("base16-colorscheme").colors.base04,
-- fg = require("base16-colorscheme").colors.base07,
-- bg = require("base16-colorscheme").colors.base00,
-- }

-- local config = require("ronny.config")
-- local colorsx = config.colors
--
-- local colors = {
--     red = colorsx.palette.red,
--     yellow = colorsx.palette.yellow,
--     green = colorsx.palette.green,
--     blue = colorsx.palette.blue,
--     purple = colorsx.palette.purple,
--     cyan = colorsx.palette.cyan,
--     bg = colorsx.palette.black,
--     fg = colorsx.palette.white,
--     gray = "#6C6D6E"
-- }

-- local colors = {
-- 	red = "#685742",
-- 	yellow = "#B36D43",
-- 	green = "#5f875f",
-- 	blue = "#78824B",
-- 	purple = "#bb7744",
-- 	cyan = "#C9A554",
-- 	bg = "#222222",
-- 	fg = "#b0b0b0",
-- 	gray = "#6C6D6E",
-- }

-- local colors = {
--     red = "#685742",
--     yellow = "#B36D43",
--     green = "#5f875f",
--     blue = "#78824B",
--     purple = "#bb7744",
--     cyan = "#C9A554",
--     bg = "#100F0F",
--     fg = "#b0b0b0",
--     gray = "#6C6D6E",
-- }

-- local palette = require("sunburn.palette")

-- local colors = {
--     red = require("sunburn.palette").yellow,
--     yellow = require("sunburn.palette").yellow,
--     green = require("sunburn.palette").green,
--     blue = require("sunburn.palette").blue,
--     purple = require("sunburn.palette").magenta,
--     cyan = require("sunburn.palette").cyan,
--     bg = "#100F0F",
--     fg = "#b0b0b0",
--     gray = "#6C6D6E",
-- bg = require("sunburn.palette").bg_1,
-- fg = require("sunburn.palette").fg_1,
-- shade = require("sunburn.palette").dim_0
-- }

-- local colors = {
-- 	red = "#BC5215",
-- 	yellow = "#BA823D",
-- 	green = "#66800b",
-- 	blue = "#3c78ac",
-- 	purple = "#bb5489",
-- 	cyan = "#349990",
-- 	bg = "#100F0F",
-- 	fg = "#828483",
-- 	shade = "#575653",
-- }

-- local solarized_palette = require("solarized.palette")
-- local colors = solarized_palette.get_colors()
-- local colors = require("solarized.utils").get_colors()
-- local colors = {
-- 	red = colorsol.red,
-- 	yellow = colorsol.yellow,
-- 	green = colorsol.green,
-- 	blue = colorsol.blue,
-- 	purple = colorsol.purple,
-- 	cyan = colorsol.cyan,
-- 	bg = colorsol.bg,
-- 	fg = colorsol.fg,
-- 	shade = "#575653",
-- }

-- local latte = require("catppuccin.palettes").get_palette("latte")
-- local colors = {
-- 	bg = latte.base,
-- 	fg = latte.base,
-- 	red = latte.red,
-- 	yellow = latte.yellow,
-- 	blue = latte.blue,
-- 	cyan = latte.cyan,
-- 	green = latte.green,
-- 	purple = latte.pink,
-- 	shade = latte.lavender,
-- }

-- local colors = {
-- 	red = "#CB4B16",
-- 	yellow = "#B58900",
-- 	green = "#859900",
-- 	blue = "#268BD2",
-- 	purple = "#6C71C4",
-- 	cyan = "#2AA198",
-- 	bg = "#002B36",
-- 	fg = "#839496",
-- 	shade = "#586E75",
-- }

-- local colors = require("moonfly").palette()

local colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
local util = require("tokyonight.util")

-- stylua: ignore

-- Icon Graveyard
-- error = "􀃂 ", warn = "􀃮 ", info = "􁊇 ", hint = "􀃬 " ▊" ▊ "" ▊" ""􀵬 "  -- icon = "  ", -- icon = " ",-- icon = " ",-- icon = "􀤭 ",-- icon = " ",-- icon = "􀉤 ",-- icon = "􀤏 ",-- icon = "􁓔 ",-- icon = "LSP",

local kirby_default = "(>*-*)>"
local mode_kirby = {
	n = "<(•ᴗ•)>",
	i = "<(•o•)>",
	v = "(v•-•)v",
	[""] = "(v•-•)>",
	V = "(>•-•)>",
	c = kirby_default,
	no = "<(•ᴗ•)>",
	s = kirby_default,
	S = kirby_default,
	[""] = kirby_default,
	ic = kirby_default,
	R = kirby_default,
	Rv = kirby_default,
	cv = "<(•ᴗ•)>",
	ce = "<(•ᴗ•)>",
	r = kirby_default,
	rm = kirby_default,
	["r?"] = kirby_default,
	["!"] = "<(•ᴗ•)>",
	t = "<(•ᴗ•)>",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.red, bg = colors.bg } },
			inactive = { c = { fg = colors.gray, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- ins_left({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.cyan, bg = "none" },
-- 	-- color = { fg = colors.yellow, bg = colors.bg }, -- Sets highlighting of component
-- 	padding = { left = 0.5 }, -- We don't need space before this
-- })

ins_left({
	-- mode component
	function()
		return ""
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.yellow,
			i = colors.green,
			v = colors.cyan,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.red,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.magenta,
			Rv = colors.magenta,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	-- padding = { left = 0.5 }, -- We don't need space before this
	-- padding = { left = 1.5, right = 1.5 },
})

-- ins_left({
--     "mode",
--     -- icons_enabled = true,
--     fmt = function()
--         return mode_kirby[vim.fn.mode()] or vim.api.nvim_get_mode().mode
--     end,
--     separator = { left = "", right = "" },
--     padding = { left = 4, right = 1 },
--     color = { fg = colors.bg, bg = colors.fg },
-- })

ins_left({
	"filesize",
	cond = conditions.buffer_not_empty,
	fmt = string.upper,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	fmt = string.upper,
	color = { fg = colors.yellow, gui = "bold" },
})

-- ins_left({
--     "harpoon2",
--     -- icon = '♥',
--     -- indicators = { "a", "s", "q", "w" },
--     -- active_indicators = { "A", "S", "Q", "W" },
--     -- color_active = { fg = "#00ff00" },
--     -- _separator = " ",
--     -- no_harpoon = "NO-POON :(",
-- })

ins_left({
	function()
		local msg = "󱩦 "
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		local msg2 = "󱩤 "
		-- local msg2 = " "
		-- local msg = " "
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return msg2
			end
		end
		return msg
	end,
	fmt = string.upper,
	color = { fg = colors.green, gui = "bold" },
})

ins_left({
	function()
		local noice = require("noice")
		local kp = noice.api.status.command.get()
		-- local haskp = require("noice").api.status.command.has
		if package.loaded["noice"] then
			-- if haskp ~= nil then
			return kp
		end
	end,
	-- icon = "􀞺 ",
	icon = "",
	color = { fg = colors.blue, gui = "bold" },
	fmt = string.upper,
})

-- ins_left({
-- 	"fileformat",
-- 	fmt = string.upper,
-- 	icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
-- 	color = { fg = colors.gray, gui = "bold" },
-- })

-- ins_left({
-- 	"o:encoding", -- option component same as &encoding in viml
-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- 	cond = conditions.hide_in_width,
-- 	-- icons_enabled = true,
-- 	color = { fg = colors.shade, gui = "bold" },
-- })

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.green },
		color_info = { fg = colors.cyan },
		color_hint = { fg = colors.white },
	},
})

ins_left({
	"buffers",
	-- fmt = string.upper,
	show_filename_only = true, -- Shows shortened relative path when set to false.
	hide_filename_extension = false, -- Hide filename extension when set to true.
	show_modified_status = false, -- Shows indicator when the buffer is modified.

	mode = 1,
	-- 0: Shows buffer name
	-- 1: Shows buffer index
	-- 2: Shows buffer name + buffer index
	-- 3: Shows buffer number
	-- 4: Shows buffer name + buffer number

	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
	-- it can also be a function that returns
	-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = "SCOPE",
		dashboard = "Dashboard",
		packer = "Packer",
		fzf = "FZF",
		alpha = "Alpha",
		Lazy = "LAZY",
	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

	-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
	-- use_mode_colors = true,

	symbols = {
		modified = " ", -- Text to show when the buffer is modified
		alternate_file = " ", -- Text to show to identify the alternate file
		directory = "󰉋 ", -- Text to show when the buffer is a directory
	},
	icons_enabled = false,
	color = { fg = colors.white, gui = "bold" },
})

ins_left({
	function()
		return "%="
	end,
})

ins_left({
	function()
		local noice = require("noice")
		local msg = noice.api.status.message.get()
		local has = require("noice").api.status.message.has
		if has ~= nil then
			return msg
		end
	end,
	-- icon = "󰀫 ",
	-- icon = "󱂅 ",
	icon = "",
	color = { fg = colors.blue, gui = "bold" },
	fmt = string.upper,
})

-- ins_right({ "location", icon = "", color = { fg = colors.cyan, gui = "bold" } })
ins_right({ "location", icon = "", color = { fg = colors.green, gui = "bold" } })

ins_right({
	"datetime",
	-- icon = "󱑋 ",
	icon = "",
	style = "%r",
	color = { fg = colors.blue, gui = "bold" },
	fmt = string.upper,
	-- padding = { right = 0.5 },
})

-- ins_right {
--     "branch",
--     icon = "",
--     color = { fg = colors.magenta, gui = "bold" },
-- }
--
-- ins_right {
--     "diff",
--     -- Is it me or the symbol for modified is really weird
--     symbols = { added = " ", modified = "󰝤 ", removed = " " },
--     diff_color = {
--         added = { fg = colors.green },
--         modified = { fg = colors.orange },
--         removed = { fg = colors.red },
--     },
--     cond = conditions.hide_in_width,
-- }

-- ins_right({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.cyan, bg = colors.bg },
-- 	padding = { right = 0.5 },
-- })

-- Now don't forget to initialize lualine
lualine.setup(config)
