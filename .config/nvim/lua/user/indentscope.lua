local M = {
	"echasnovski/mini.indentscope",
	version = false,
	event = "BufReadPost",
}

function M.config()
	local gen_animation = require("mini.indentscope").gen_animation
	require("mini.indentscope").setup({
		draw = {
			delay = 0,
			animation = gen_animation.quadratic({ easing = "out", duration = 4000, unit = "total" }),
		},
		-- symbol = "┇",
		symbol = "",
		options = { try_as_border = true },
	})
end
return M
