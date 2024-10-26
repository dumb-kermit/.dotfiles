local lualine = require("lualine")

-- local colors = {
-- red = "#FF0018",
-- green = "#8BBE00",
-- yellow = "#FFB100",
-- blue = "#39ACE9",
-- purple = "#FF3B91",
-- cyan = "#00B3B4",
-- bg = "#1C1B19",
-- fg = "#bebebe",
-- shade = "#968074",
-- }

-- [Gruvbox]
local colors = {
	-- bg = "#1D2021",
	bg = "none",
	fg = "#b1c1e1",
	shade = "#928374",
	cyan = "#689D6A",
	red = "#FA4934",
	green = "#B9BB27",
	yellow = "#FE8018",
	purple = "#D3859B",
	blue = "#458488",
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

ins_left({
	-- mode component
	function()
		return "[MODE]"
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
	-- padding = { left = 1.5, right = 1.5 },
})

-- ins_left({
-- 	"mode",
-- })

-- ins_left({
-- "filename",
-- cond = conditions.buffer_not_empty,
-- fmt = string.upper,
-- color = { fg = colors.yellow, gui = "bold" },
-- })

ins_left({
	"buffers",
	-- fmt = string.upper,
	show_filename_only = true, -- Shows shortened relative path when set to false.
	hide_filename_extension = true, -- Hide filename extension when set to true.
	show_modified_status = false, -- Shows indicator when the buffer is modified.

	mode = 0,
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
	use_mode_colors = true,

	symbols = {
		modified = "●", -- Text to show when the buffer is modified
		alternate_file = "", -- Text to show to identify the alternate file
		directory = "", -- Text to show when the buffer is a directory
	},
	icons_enabled = false,
	color = { fg = colors.white, gui = "bold" },
	fmt = string.upper,
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
	color = { fg = colors.cyan, gui = "bold" },
	fmt = string.upper,
})

ins_right({
	function()
		local noice = require("noice")
		local kp = noice.api.status.command.get()
		-- local haskp = require("noice").api.status.command.has
		if package.loaded["noice"] then
			-- if haskp ~= nil then
			return kp
		end
	end,
	icon = "􀞺 ",
	color = { fg = colors.shade, gui = "bold" },
	fmt = string.upper,
})

-- ins_right({
-- require("lazy.status").updates,
-- cond = require("lazy.status").has_updates,
-- padding = { left = 1, right = 2 },
-- color = { fg = colors.green },
-- separator = { right = "" },
-- })

ins_right({ "location", icon = "", color = { fg = colors.cyan, gui = "bold" } })

ins_right({
	"datetime",
	icon = "󱑋",
	style = "%I:%M%p",
	color = { fg = colors.yellow, gui = "bold" },
	fmt = string.upper,
	-- padding = { right = 0.5 },
})

lualine.setup(config)
