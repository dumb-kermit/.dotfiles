local M = {
	"ThePrimeagen/harpoon",
	keys = { { "<Tab>" } },
	-- event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}

function M.config()
	require("harpoon").setup({
		menu = {
			width = vim.api.nvim_win_get_width(0) - 58,
		},
	})
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	keymap("n", "<leader>hm", "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
	keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
end

function M.mark_file()
	require("harpoon.mark").add_file()
	vim.notify("󱡅  marked file")
end

return M
