-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
local colors = {
	-- bg = "#222222",
	-- fg = "#bbc2cf",
	-- yellow = "#C5653B",
	-- cyan = "#D5A244",
	-- darkblue = "#758343",
	-- green = "#4C895B",
	-- orange = "#6E553F",
	-- violet = "#a9a1e1",
	-- magenta = "#CD6F3A",
	-- blue = "#51afef",
	-- red = "#6E553F",
	bg = "#242424",
	fg = "#c0caf5",
	selection = "#242424",
	comment = "#545454",
	red = "#ff5555",
	orange = "#ffcb6b",
	yellow = "#ffcb6b",
	green = "#50fa7b",
	purple = "#c792ea",
	cyan = "#8be9fd",
	pink = "#82aaff",
	white = "#b1c1e1",
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

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
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
		lualine_v = {},
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

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- ins_left({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.blue }, -- Sets highlighting of component
-- 	left_padding = 0, -- We don't need space before this
-- })

ins_left({
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
		return ""
	end,
	color = "LualineMode",
	left_padding = 0,
})

ins_left({
	-- filesize component
	function()
		local function format_file_size(file)
			local size = vim.fn.getfsize(file)
			if size <= 0 then
				return ""
			end
			local sufixes = { "b", "k", "m", "g" }
			local i = 1
			while size > 1024 do
				size = size / 1024
				i = i + 1
			end
			return string.format("%.1f%s", size, sufixes[i])
		end
		local file = vim.fn.expand("%:p")
		if string.len(file) == 0 then
			return ""
		end
		return format_file_size(file)
	end,
	condition = conditions.buffer_not_empty,
})

ins_left({
	"filename",
	condition = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
})

-- ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

-- ins_right({ "location" })

-- ins_left({
-- 	"diagnostics",
-- 	sources = { "nvim_lsp" },
-- 	symbols = { error = " ", warn = " ", info = " " },
-- 	color_error = colors.red,
-- 	color_warn = colors.yellow,
-- 	color_info = colors.cyan,
-- })

ins_left({
	"diagnostics",
	sources = { "nvim_lsp" },
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
	-- use_mode_colors = true,

	-- symbols = {
	-- modified = " ", -- Text to show when the buffer is modified
	-- alternate_file = " ", -- Text to show to identify the alternate file
	-- directory = "󰉋 ", -- Text to show when the buffer is a directory
	-- },
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
	-- icon = "",
	color = { fg = colors.cyan, gui = "bold" },
	fmt = string.upper,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

-- ins_left({
-- 	-- Lsp server name .
-- 	function()
-- 		local msg = "No Active Lsp"
-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
-- 		local clients = vim.lsp.get_active_clients()
-- 		if next(clients) == nil then
-- 			return msg
-- 		end
-- 		for _, client in ipairs(clients) do
-- 			local filetypes = client.config.filetypes
-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 				return client.name
-- 			end
-- 		end
-- 		return msg
-- 	end,
-- 	icon = " LSP:",
-- 	color = { fg = colors.fg, gui = "bold" },
-- })

-- Add components to right sections
-- ins_right({
-- 	"o:encoding", -- option component same as &encoding in viml
-- 	upper = true, -- I'm not sure why it's upper case either ;)
-- 	condition = conditions.hide_in_width,
-- 	color = { fg = colors.green, gui = "bold" },
-- })

-- ins_right({
-- 	"fileformat",
-- 	upper = true,
-- 	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
-- 	color = { fg = colors.green, gui = "bold" },
-- })

ins_right({
	function()
		return "%="
	end,
})

ins_right({
	"branch",
	icon = "",
	condition = conditions.check_git_workspace,
	color = { fg = colors.violet, gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "柳 ", removed = " " },
	color_added = colors.green,
	color_modified = colors.orange,
	color_removed = colors.red,
	condition = conditions.hide_in_width,
})

ins_right({ "location", icon = "", color = { fg = colors.cyan, gui = "bold" } })
-- ins_right({ "location", icon = "", color = { fg = colors.green, gui = "bold" } })

ins_right({
	"datetime",
	-- icon = "󱑋 ",
	icon = "",
	style = "%I:%M %p",
	color = { fg = colors.yellow, gui = "bold" },
	fmt = string.upper,
	-- padding = { right = 0.5 },
})

-- ins_right({
-- 	function()
-- 		return "▊"
-- 	end,
-- 	color = { fg = colors.blue },
-- 	right_padding = 0,
-- })

-- Now don't forget to initialize lualine
lualine.setup(config)
