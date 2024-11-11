local M = {
	"Tsuzat/NeoSolarized.nvim",
	event = "UiEnter",
}

function M.config()
	local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

	if not ok_status then
		return
	end

	NeoSolarized.setup({
		style = "light", -- "dark" or "light"
		transparent = false, -- true/false; Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
		styles = {
			-- Style to be applied to different syntax groups
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = {},
			string = { italic = true },
			constants = { underline = true },
			underline = true, -- true/false; for global underline
			undercurl = true, -- true/false; for global undercurl
		},
		-- Add specific hightlight groups
		on_highlights = function(highlights, colors)
			-- highlights.#00333DInclude.fg = colors.red -- Using `red` foreground for Includes
		end,
	})
	vim.cmd([[colorscheme NeoSolarized]])
	vim.cmd("hi EndOfBuffer guifg=#05313C")
	vim.cmd("hi MiniStatuslineDevinfo guibg=#4E6F76 guifg=#00333D")
	vim.cmd("hi MiniStatuslineFileinfo guibg=#4E6F76 guifg=#00333D")
	vim.cmd("hi MiniStatuslineFilename guibg=#4E6F76 guifg=#00333D")
	vim.cmd("hi MiniStatuslineModeNormal guibg=#4E6F76 guifg=#b1c1e1")
	vim.cmd("hi MiniStatuslineModeInsert guibg=#4E6F76 guifg=#b1c1e1")
	vim.cmd("hi MiniStatuslineModeCommand guibg=#4E6F76 guifg=#b1c1e1")
	vim.cmd("hi Constant cterm=underline gui=underline")
end
return M
