-- require("eza-preview"):setup()
function Linemode:size_and_mtime()
	local year = os.date("%Y")
	local time = math.floor(self._file.cha.modified or 0)

	if time > 0 and os.date("%Y", time) == year then
		time = os.date("%d/%H:%M", time)
	else
		time = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	return ui.Line(string.format(" %s %s ", size and ya.readable_size(size) or "-", time))
end

function Status:name()
	local h = self._tab.current.hovered
	if not h then
		return ui.Line({})
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Line(" " .. h.name .. linked)
end

require("zoxide"):setup({
	update_db = true,
})

-- require("dual-pane"):setup({
-- 	enabled = true,
-- })

require("yatline"):setup({
	-- section_separator = { open = "", close = " " },
	-- part_separator = { open = "", close = "" },
	section_separator = { open = "", close = "" },
	part_separator = { open = " ", close = "" },
	inverse_separator = { open = " ", close = " " },
	-- inverse_separator = { open = "", close = "" },

	style_a = {
		fg = "green",
		bg_mode = {
			normal = "#CDD3E1",
			select = "yellow",
			un_set = "red",
		},
	},
	style_b = { bg = "#CDD3E1", fg = "yellow" },
	style_c = { bg = "#CDD3E1", fg = "cyan" },

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "darkgray",

	tab_width = 1,
	tab_use_inverse = false,

	selected = { icon = "󰻭", fg = "magenta" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = false,

	display_header_line = false,
	display_status_line = true,

	status_line = {
		left = {
			section_a = {
				{ type = "coloreds", custom = true, name = { { " 󰇥 ", "blue" } } },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_name" },
			},
		},
		right = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
	},

	header_line = {
		left = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},
})

-- require("full-border"):setup({
-- 	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
-- 	type = ui.Border.ROUNDED,
-- })
