local M = {
	"tiagovla/tokyodark.nvim",
	event = "UiEnter",
}

function M.config()
	vim.cmd([[colorscheme tokyodark]])
end
return M
