local M = {
	"pappasam/papercolor-theme-slim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	-- vim.cmd("set  background=light")
	vim.cmd("colorscheme PaperColorSlim")
	vim.cmd("hi EndOfBuffer guifg=#1C1C1C")
	vim.cmd("hi StatusLine guibg=#1C1C1C guifg=#AFD700")
	vim.cmd("hi CursorLineNr guifg=#AFD700")
	vim.cmd("hi Comment cterm=italic gui=italic")
	vim.cmd("hi Keyword cterm=italic gui=italic")
	vim.cmd("hi String cterm=italic gui=italic")
	vim.cmd("hi TelescopeBorder guifg=#B984DC guibg=none")
	vim.cmd("hi TelescopeNormal guibg=#1c1c1c")
	vim.cmd("hi WhichKeyBorder guifg=#1c1c1c guibg=#1c1c1c")
	vim.cmd("hi WhichkeyNormal guibg=#1c1c1c")
	vim.cmd("hi MiniStatuslineFilename guibg=#1c1c1c guifg=#AFD700")
	vim.cmd("hi MiniStatuslineModeNormal guibg=#afd700 guifg=#1c1c1c")
	vim.cmd("hi MiniStatuslineModeInsert guibg=#FF5FAF guifg=#1c1c1c")
	vim.cmd("hi MiniStatuslineModeCommand guibg=#b1c1e1 guifg=#1c1c1c")
end

return M
