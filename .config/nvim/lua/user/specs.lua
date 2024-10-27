local M = {
	"edluffy/specs.nvim",
	event = "BufReadPost",
}

function M.config()
	require("specs").setup({
		show_jumps = true,
		min_jump = 1,
		popup = {
			delay_ms = 0, -- delay before popup displays
			inc_ms = 18, -- time increments used for fade/resize effects
			blend = 20, -- starting blend, between 0-100 (fully transparent), see :h winblend
			width = 20,
			winhl = "IncSearch",
			fader = require("specs").sinus_fader,
			resizer = require("specs").shrinesizer,
		},
		ignore_filetypes = { "TelescopePrompt" },
		ignore_buftypes = {
			nofile = true,
		},
	})
end
return M
