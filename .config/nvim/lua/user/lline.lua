local M = {
	"itchyny/lightline.vim",
	event = "VeryLazy",
}

function M.config()
	vim.o.laststatus = 2
end
return M
