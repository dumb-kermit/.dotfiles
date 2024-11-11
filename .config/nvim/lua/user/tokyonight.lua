local M = {
	"folke/tokyonight.nvim",
	event = "UiEnter",
	priority = 1000,
}

function M.config()
	-- vim.cmd("set background=dark")
	---@class tokyonight.Config
	---@field on_colors fun(colors: ColorScheme)
	---@field on_highlights fun(highlights: tokyonight.Highlights, colors: ColorScheme)
	require("tokyonight").setup({
		style = "day", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = { italic = true },
			-- constants = { underline = true },
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
		-- day_brightness = 0.18, --Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		--@param colors ColorScheme
		on_colors = function(colors)
			-- colors.bg = "#ADB5BD"
			-- colors.bg = "#909DA8"
			colors.bg = "#b6bfe2"
			-- colors.bg = "#D5D6DB"
			-- colors.bg = "#D5D6DB"
			-- colors.bg = "#CDD3E1"
			-- colors.bg = "#D5D6DB"
			-- colors.bg = "#D1D5E3"
			-- colors.fg = "#1A1A1A"
			-- colors.bg_dark = "#1A1A1A"
			-- colors.fg = "#b1c1e1"
		end,
		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights tokyonight.Highlights
		---@param colors ColorScheme
		on_highlights = function(hl, c)
			-- hl.EndOfBuffer = {
			-- fg = "#E1E2E6",
			-- }
			-- local prompt = "#2d3149"
			local prompt = "#A5AFCE"
			-- local stlbg = "#A5AFCE"
			local mnbg = "#23283B"
			-- hl.TelescopeNormal = {
			-- 	bg = c.bg_dark,
			-- 	fg = c.fg_dark,
			-- }
			-- hl.TelescopeBorder = {
			-- 	bg = c.bg_dark,
			-- 	fg = c.bg_dark,
			-- }
			-- hl.TelescopePromptNormal = {
			-- 	bg = prompt,
			-- }
			-- hl.TelescopePromptBorder = {
			-- 	bg = prompt,
			-- 	fg = prompt,
			-- }
			-- hl.TelescopePromptTitle = {
			-- 	bg = prompt,
			-- 	fg = prompt,
			-- }
			-- hl.TelescopePreviewTitle = {
			-- 	bg = c.bg_dark,
			-- 	fg = c.bg_dark,
			-- }
			-- hl.TelescopeResultsTitle = {
			-- 	bg = c.bg_dark,
			-- 	fg = c.bg_dark,
			-- }
			-- hl.MiniStatuslineFilename = {
			-- 	bg = stlbg,
			-- }
			-- hl.StatusLine = {
			-- 	bg = c.bg,
			-- 	fg = c.yellow,
			-- }
			-- hl.DiagnosticVirtualTextError = {
			-- 	bg = c.bg,
			-- 	fg = c.yellow,
			-- }
			-- hl.DiagnosticVirtualTextWarn = {
			-- 	bg = c.bg,
			-- 	fg = c.yellow,
			-- }
			-- hl.DiagnosticVirtualTextInfo = {
			-- 	bg = c.bg,
			-- 	fg = c.green,
			-- }
			-- hl.DiagnosticVirtualTextHint = {
			-- 	bg = c.bg,
			-- 	fg = c.cyan,
			-- }
			hl.StatusLine = {
				bg = "#C2C8DC",
				fg = "#035AB3",
			}
			-- hl.EndOfBuffer = {
			-- 	bg = mnbg,
			-- 	fg = mnbg,
			-- }
		end,

		cache = true, -- When set to true, the theme will be cached for better performance

		---@type table<string, boolean|{enabled:boolean}>
		plugins = {
			-- enable all plugins when not using lazy.nvim
			-- set to false to manually enable/disable plugins
			all = package.loaded.lazy == nil,
			-- uses your plugin manager to automatically enable needed plugins
			-- currently only lazy.nvim is supported
			auto = true,
			-- add any plugins here that you want to enable
			-- for all possible plugins, see:
			--   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
			-- telescope = true,
		},
	})
	vim.cmd("colorscheme tokyonight")
	vim.cmd("hi Constant cterm=underline gui=underline")
	vim.cmd("hi MiniDiffSignDelete guifg=#FF0065")
	vim.cmd("hi MiniDiffSignChange guifg=#1b1c1d")
	vim.cmd("hi MiniDiffSignAdd guifg=#8243C4")
	-- vim.cmd("hi StatusLine guibg=#3157AC guifg=#CDD3E1")
	vim.cmd("hi StatusLine guifg=#3157AC guibg=none")
end
return M
