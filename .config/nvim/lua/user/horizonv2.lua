local M = {
	"akinsho/horizon.nvim",
	version = "*",
	event = "UiEnter",
}

function M.config()
	-- require("horizon").setup{
	-- overrides = {
	-- colors = {
	-- Normal = { bg = "#0e0e0e" },
	-- },
	-- },
	-- }
	vim.cmd("set background=light")
	vim.cmd.colorscheme("horizon")
end
return M
