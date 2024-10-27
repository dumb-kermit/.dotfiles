local M = {
	"nvim-lualine/lualine.nvim",
	event = "UiEnter",
	-- dependencies = {
	-- "letieu/harpoon-lualine",
	-- },
}

function M.config()
	-- require("lualine").setup()
	-- require("user.myline.bubbles")
	-- require("user.myline.thin")
	require("user.myline.evil_lualine")
	-- require("user.myline.statusline")
	-- require("lualine").setup({
	-- options = {
	-- theme = "auto",
	-- icons_enabled = false,
	-- component_separators = "|",
	-- section_separators = "",
	-- disabled_filetypes = {
	-- statusline = { "NvimTree" },
	-- },
	-- },

	-- options = {
	--         component_separators = { left = "", right = "" },
	--         section_separators = { left = "", right = "" },
	--         ignore_focus = { "Telescope" },
	-- theme = "16color",
	-- },
	--     sections = {
	--         -- lualine_a = {},
	--         lualine_b = { "filetype", "branch" },
	--         lualine_c = { "diagnostics" },
	--         lualine_x = { "harpoon2" },
	--         lualine_y = { "progress" },
	--         -- lualine_z = {},
	--     },
	--     extensions = { "quickfix", "man", "fugitive" },
	-- })
	-- vim.cmd("hi lualine_c_normal guifg=#0090D8 guibg=#1C1B19")
	-- vim.cmd("hi lualine_b_normal guifg=#FA0026 guibg=#1C1B19")
end

return M
