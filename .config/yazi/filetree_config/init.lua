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

require("simple-status"):setup()
