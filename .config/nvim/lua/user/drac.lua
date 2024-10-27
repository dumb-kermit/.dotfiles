local M = {
	"dracula/vim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme dracula")
end

return M
