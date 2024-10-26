local M = {
	"sainnhe/sonokai",
	event = "UiEnter",
}

function M.config()
	vim.g.sonokai_style = "shusia"
	vim.g.sonokai_show_eob = 0
	vim.g.sonokai_better_performance = 1
	vim.g.sonokai_enable_italic = true
	vim.cmd.colorscheme("sonokai")
end
return M
