local M = {
	"nyoom-engineering/oxocarbon.nvim",
	event = "UiEnter",
}

function M.config()
	vim.opt.background = "dark" -- set this to dark or light
	vim.cmd.colorscheme("oxocarbon")
	vim.cmd("hi EndOfBuffer guifg=#161616")
	vim.cmd("hi Comment gui=italic cterm=italic guifg=#BCBFC0")
	vim.cmd("hi Conditional gui=italic cterm=italic")
	vim.cmd("hi Keyword gui=italic cterm=italic")
	vim.cmd("hi String gui=italic cterm=italic")
	vim.cmd("hi TelescopeSelection guibg=#161616 guifg=#3FDBD9")
	vim.cmd("hi TelescopeSelectionCaret guibg=#161616 guifg=#3FDBD9")
	vim.cmd("hi TelescopeMatching guifg=#3FDBD9")
end

return M
