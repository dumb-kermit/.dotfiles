local M = {
	"NLKNguyen/papercolor-theme",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme papercolor")
	vim.cmd("hi TelescopeBorder guifg=#2C2C2C guibg=#2C2C2C")
	vim.cmd("hi TelescopeNormal guibg=#2C2C2C")
	vim.cmd("hi TelescopePromptBorder guifg=#2C2C2C guibg=#2C2C2C")
end

return M
