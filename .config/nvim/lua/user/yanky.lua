local M = {
	"gbprod/yanky.nvim",
	dependencies = "kkharji/sqlite.lua",
	event = "BufReadPost",
	keys = {
		{
			"<leader>p",
			function()
				vim.cmd([[YankyRingHistory]])
			end,
			mode = { "n", "x" },
			desc = "Open Yank History",
		},
	},
}

function M.config()
	require("yanky").setup({
		ring = {
			history_length = 100,
			storage = "sqlite",
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 500,
		},
	})

	require("telescope").load_extension("yank_history")

	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

	vim.keymap.set("n", "<S-p>", "<Plug>(YankyPreviousEntry)")
	vim.keymap.set("n", "<S-n>", "<Plug>(YankyNextEntry)")
end

return M
