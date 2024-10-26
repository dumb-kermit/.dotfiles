local M = {
	"judaew/ronny.nvim",
	event = "UiEnter",
}

function M.config()
	require("ronny").setup({
		display = {
			-- Enable original Monokai colors
			monokai_original = true,
			-- Highlight only LineNr (current line number) for cursorline
			-- option. This also enables cursorline (:set cursorline)
			only_CursorLineNr = true,
			-- Highlight LineNr for relativenumbers. This also enables
			-- relativenumbers option (:set relativenumbers)
			hi_relativenumber = false,
			-- Highlight unfocused windows when using :split or :vsplit
			hi_unfocus_window = false,
			-- Highlight formatted @text (e.g., italic, strong) in yellow
			-- in addition to font attributes to make the text more visible
			hi_formatted_text = true,
			-- Highlight comment in italics
			hi_comment_italic = true,
		},
		plugins = {
			treesitter = true,
			telescope = true,
			-- nvimtree        = true,
			nvim_cmp = true,
			whichkey = true,
			-- gitgutter       = true,
			-- gitsigns        = true,
			-- indentblankline = true,
		},
		better_syntax = {
			c = true,
			cpp = true,
			json = true,
			html = true,
			php = true,
			css = true,
			javascript = true,
			typescript = true,
			xml = true,
			ruby = true,
			yaml = true,
			sql = true,
			sh = true,
			lua = true,
			tex = true,
			python = true,
			go = true,
			markdown = true,
			orgmode = true,
		},
	})
	vim.cmd.colorscheme("ronny")
	vim.cmd("hi SignColumn guifg=#a6e22e guibg=#1A1D1E")
	vim.cmd("hi LineNr guifg=#465457 guibg=#1A1D1E")
	vim.cmd("hi CursorLineNr guifg=#B87EFF guibg=#1A1D1E")
	vim.cmd("hi EndOfBuffer guifg=#1A1D1E guibg=#1A1D1E")
	vim.cmd("hi Comment guifg=#7e8e91 cterm=italic gui=italic")
	vim.cmd("hi Identifier guifg=#fd971f cterm=italic gui=italic")
end

return M
