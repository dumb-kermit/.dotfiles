local M = {
	"loganswartz/sunburn.nvim",
	dependencies = { "loganswartz/polychrome.nvim" },
	event = "UiEnter",
}

function M.config()
	vim.cmd("set background=dark")
	vim.g.sunburn_palette_size = 8
	vim.g.sunburn_bright_variant = true
	vim.cmd.colorscheme("sunburn")
	vim.cmd("hi EndofBuffer guifg=#181818")
	vim.cmd("hi CursorLineNr guibg=#181818 guifg=#9880D0")
	-- vim.cmd("hi TelescopeBorder guifg=#181818 guibg=#181818")
	-- vim.cmd("hi WhichKeyBorder guibg=#181818 guifg=#9880D0")
	vim.cmd("hi Comment cterm=italic gui=italic")
	-- vim.cmd "hi Type cterm=underline gui=underline"
	vim.cmd("hi String cterm=italic gui=italic")
	vim.cmd("hi StatusLine guibg=#181818 guifg=#2587BE")
	-- vim.cmd("hi Comment guifg=#2C3539")
	vim.cmd("hi @variable guifg=#b1c1e1")
	vim.cmd("hi @variable.member guifg=#b1c1e1")

	-- vim.cmd("hi Normal guibg=none")
	-- vim.cmd("hi EndOfBuffer guifg=#361F1B")
	vim.cmd("hi WhichKey guibg=none")
	vim.cmd("hi WhichKeyNormal guibg=none")
	vim.cmd("hi WhichKeyBorder guibg=none")

	-- vim.cmd("hi Normal guibg=#282828")
	-- vim.cmd("hi StatusLine guibg=#7E8286 guifg=#282828")
	-- vim.cmd("hi EndOfBuffer guifg=#282828")
	-- vim.cmd("hi SignColumn guibg=#282828")
end

return M
