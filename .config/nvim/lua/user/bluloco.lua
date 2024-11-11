local M = {
	"uloco/bluloco.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme bluloco")
end
return M
