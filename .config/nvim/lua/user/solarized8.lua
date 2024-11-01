local M = {
	"lifepillar/vim-solarized8",
	branch = "neovim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	-- vim.cmd("set notermguicolors")
	-- vim.cmd("let g:solarized_statusline = normal")
	-- vim.cmd("let g:solarized_visibility = high")
	vim.g.solarized_visibility = "low"
	vim.cmd("colorscheme solarized8")
	-- vim.cmd("hi EndOfBuffer ctermfg=black")
	-- vim.cmd("hi LineNr ctermbg=black ctermfg=8")
	-- vim.cmd("hi StatusLine ctermfg=black ctermbg=4")
	-- vim.cmd("hi Normal ctermbg=black")
	-- vim.cmd("hi SignColumn ctermfg=none ctermbg=none")
	-- vim.cmd("hi TelescopeSelection ctermbg=none ctermfg=red")
	-- vim.cmd("hi TelescopeMatching ctermbg=none ctermfg=red")
	-- vim.cmd("hi LazyNormal ctermbg=none ctermfg=white")
	-- vim.cmd("hi LazyButton ctermbg=none ctermfg=8")
	-- vim.cmd("hi LazyButtonActive ctermfg=blue ctermbg=none")
	-- vim.cmd("hi LazyH1 ctermbg=none ctermfg=green")
end
return M
