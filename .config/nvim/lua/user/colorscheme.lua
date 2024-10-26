local M = {
	"kepano/flexoki-neovim",
	name = "flexoki",
	priority = 1000,
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.cmd("colorscheme flexoki-dark")
	-- vim.cmd("hi EndofBuffer guibg=#100F0F guifg=#100F0F")
	-- vim.cmd("hi MiniStatuslineDevinfo guibg=#100F0F guifg=#94989F")
	-- vim.cmd("hi MiniStatuslineFileinfo guibg=#100F0F guifg=#94989F")
	-- vim.cmd("hi MiniStatuslineFilename guibg=#100F0F guifg=#94989F")
	-- vim.cmd("hi MiniStatuslineModeNormal guibg=#100F0F guifg=#D9A000")
	-- vim.cmd("hi MiniStatuslineVisual guibg=#100F0F guifg=#829B20")
	-- vim.cmd("hi MiniStatuslineModeInsert guibg=#100F0F guifg=#EA6804")
	-- vim.cmd("hi MinistatuslineModeCommand guibg=#100F0F guifg=#2287C3")
	-- vim.cmd("hi Statusline guibg=#100F0F guifg=#d0a215")
	-- vim.cmd("hi WhichKeyBorder guifg=#EA6804 guibg=#100F0F")
	-- vim.cmd("hi WhichKey guibg=#100F0F")
	-- vim.cmd("hi WhichKeyNormal guifg=#94989F guibg=#100F0F")
	vim.cmd("hi Keyword cterm=italic gui=italic")
	vim.cmd("hi Function cterm=italic gui=italic")
	vim.cmd("hi Statement cterm=italic gui=italic")
	-- vim.cmd("hi TelescopeBorder guifg=#100F0F guibg=#100F0F")
	-- vim.cmd("hi MsgArea guibg=#100F0F guifg=#EA6804")

	vim.cmd("hi Statusline guibg=#1C1B1A guifg=#d0a215")
	vim.cmd("hi EndOfBuffer guibg=#1C1B1A guifg=#1C1B1A")
	vim.cmd("hi MsgArea guibg=#1C1B1A guifg=#EA6804")
	vim.cmd("hi Normal guibg=#1C1B1A")
end

return M
