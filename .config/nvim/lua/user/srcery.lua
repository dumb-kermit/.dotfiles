local M = {
	"srcery-colors/srcery-vim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("let g:srcery_italic = 1")
	vim.cmd("let g:srcery_undercurl=0")
	vim.cmd("let g:srcery_italic_types=1")
	vim.g.srcery_dim_lisp_paren = 1
	vim.g.srcery_guisp_fallback = "fg"
	-- vim.g.srcery_white = "#bebebe"
	vim.g.srcery_bright_white = "#b1c1e1"
	-- vim.g.srcery_bg_passthrough = 1
	-- vim.g.srcery_bg = { 0, 0 }
	vim.cmd("colorscheme srcery")
	vim.cmd("hi EndOfBuffer guifg=#1C1B19")
	vim.cmd("hi WhichKey guibg=#1C1B19 guifg=#8BBE00")
	vim.cmd("hi WhichKeyNormal guibg=#1C1B19")
	vim.cmd("hi StatusLine guibg=#1c1b19 guifg=#dfa922")

	vim.cmd("hi MiniStatuslineFilename guibg=none guifg=#dfa922")
	-- vim.cmd "hi TelescopeBorder guifg=#1c1b19"
end

return M
