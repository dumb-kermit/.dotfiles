local M = {
	"rasulomaroff/reactive.nvim",
	event = "InsertEnter",
}

function M.config()
	require("reactive").setup({
		load = { "catppuccin-frappe-cursor", "catppuccin-frappe-cursorline" },
	})
	-- require("reactive").setup({
	-- 	builtin = {
	-- 		cursorline = true,
	-- 		cursor = true,
	-- 		modemsg = true,
	-- 	},
	-- })
end
return M
