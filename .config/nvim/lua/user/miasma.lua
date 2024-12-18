local M = {
	"xero/miasma.nvim",
	event = "VimEnter",
}

function M.config()
	vim.cmd("colorscheme miasma")
	vim.cmd("hi MiniClueBorder guibg=#222222 guifg=#bc6630")
	vim.cmd("hi MiniClueDescGroup guibg=#222222")
	vim.cmd("hi MiniClueDescSingle guibg=#222222")
	vim.cmd("hi MiniClueSeparator guibg=#222222 guifg=#687539")
	vim.cmd("hi MiniClueNextKey guibg=#222222 guifg=#5a5a5a")
	vim.cmd("hi TelescopePromptTitle guibg=#b6b6b6")
	vim.cmd("hi TelescopePreviewTitle guibg=#b6b6b6")
	vim.cmd("hi TelescopeResultsTitle guibg=#b6b6b6")
	vim.cmd("hi TelescopeBorder guifg=#222222 guibg=#222222")
	vim.cmd("hi TelescopePromptBorder guifg=#222222 guibg=#222222")
	vim.cmd("hi TelescopePromptNormal guibg=#222222 guifg=#bc6630")
	vim.cmd("hi TelescopeSelection guibg=#bc6630 guifg=#b6b6b6")
	vim.cmd("hi TelescopeSelectionCaret guibg=#bc6630 guifg=#b6b6b6")
	vim.cmd("hi TelescopeMatching guifg=#b6b6b6")
	vim.cmd("hi MiniStatuslineFilename guibg=#222222 guifg=#bc6630")
	vim.cmd("hi MinistatuslineFileinfo guibg=#222222 guifg=#d39500")
	vim.cmd("hi String guifg=#444444 cterm=italic gui=italic")
	vim.cmd("hi LineNr guibg=#222222")
	vim.cmd("hi EndOfBuffer guifg=#222222")
	vim.cmd("hi FoldColumn guibg=#222222")
	vim.cmd("hi NoiceCmdlinePopupBorder guifg=#bb7744 guibg=#222222")
	vim.cmd("hi NoiceCmdlineIcon guibg=#222222 guifg=#c0c0c0")
	vim.cmd("hi MiniNotifyBorder guibg=#222222 guifg=#BB7744")
	vim.cmd("hi Variable cterm=underline gui=underline")
	vim.cmd("hi Function cterm=underline gui=underline")
	vim.cmd("hi Comment guifg=#666666 cterm=italic gui=italic")
	vim.cmd("hi CursorLineNR guibg=#222222 guifg=#BB7744")
	vim.cmd("hi TelescopePromptPrefix guibg=#222222 guifg=#BB7744")
	vim.cmd("hi SignColumn guibg=#222222")

	vim.cmd("hi TelescopeSelection guifg=#bc6630 guibg=#222222")
	vim.cmd("hi TelescopeSelectionCaret guifg=#bc6630 guibg=#222222")
	vim.cmd("hi TelescopeMatching guifg=#bc6630")

	-- vim.cmd("hi CursorLineNR guibg=none guifg=#BB7744")
	-- vim.cmd("hi LineNr guibg=none")
	-- vim.cmd("hi FoldColumn guibg=none")
	-- vim.cmd("hi SignColumn guibg=none")
	-- vim.cmd("hi Normal guibg=none")
	-- vim.cmd("hi TelescopePromptPrefix guibg=none guifg=#BB7744")
	-- vim.cmd("hi TelescopeSelection guifg=#bc6630 guibg=none")
	-- vim.cmd("hi TelescopeSelectionCaret guifg=#bc6630 guibg=none")
	-- vim.cmd("hi TelescopeBorder guifg=#222222 guibg=none")
	-- vim.cmd("hi TelescopePromptBorder guifg=#222222 guibg=none")
	-- vim.cmd("hi TelescopePromptNormal guibg=none guifg=#bc6630")
	--
	vim.cmd("hi Comment guifg=#464646 cterm=italic gui=italic")
	vim.cmd("hi String guifg=#c3d0e8 cterm=italic gui=italic")
end

return M
