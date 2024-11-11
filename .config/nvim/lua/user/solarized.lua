local M = {
	"maxmx03/solarized.nvim",
	event = "UiEnter",
}

function M.config()
	vim.o.background = "dark"

	-- default config
	require("solarized").setup({
		transparent = {
			enabled = false,
			pmenu = true,
			normal = true,
			normalfloat = true,
			neotree = true,
			nvimtree = true,
			whichkey = true,
			telescope = true,
			lazy = true,
		},
		on_highlights = function(colors, color)
			local darken = color.darken
			local lighten = color.lighten
			local blend = color.blend
			local shade = color.shade
			local tint = color.tint
			local prompt = "#2d3149"

			---@type solarized.highlights
			local groups = {
				-- Visual = { bg = colors.base02, standout = true },
				-- Function = { fg = colors.yellow },
				-- IncSearch = { fg = colors.orange, bg = colors.mix_orange },
				-- Search = { fg = colors.violet, bg = shade(colors.violet, 5) },
				-- NormalFloat = { bg = darken(colors.base03, 45) },
				-- Normal = { fg = colors.fg, bg = colors.base03 },
				-- NoiceCmdLineIcon = { bg = colors.base03, fg = colors.red },
				-- NoiceCmdLinePopupBorder = { bg = colors.base03, fg = colors.red },
				-- LineNR = { bg = colors.base03 },
				-- CursorLine = { bg = "#221e19" },
				-- CursorLineNr = { bg = colors.base03, fg = colors.orange },
				-- TelescopeNormal = {
				-- 	bg = colors.bg,
				-- 	fg = colors.fg,
				-- },
				-- TelescopeBorder = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
				-- TelescopePromptNormal = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
				-- TelescopePromptBorder = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
				-- TelescopePromptTitle = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
				-- TelescopePreviewTitle = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
				-- TelescopeResultsTitle = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- },
			}

			return groups
		end,
		on_colors = function(colors, color)
			local lighten = color.tint
			local darken = color.darken
			local shade = color.shade
			local tint = color.tint
			return {
				-- fg = "#bebebe",
				-- green = "#7D9A00",
				-- red = "#E33300",
				-- blue = "#0090D8",
				-- yellow = "#C08000",
				-- cyan = "#58D1EB",
				-- violet = "#B87EFF",
				-- base03 = "#1C1B19",
				-- base04 = "#1C1B19",
				-- fg = lighten(colors.base00, 2),
				-- bg = colors.base03,
				-- bg = darken(colors.base03, 20),
				-- bg = "#1B1813",
				-- base03 = "#002530",
				-- bg = "#242423",
				-- bg = "#1c1b19",
				-- base03 = "#1c1b19",
				-- base04 = "#1c1b19",
				-- bg = "#1C1814",
				-- base04 = "#1c1b1a",
				-- base03 = "#161618",
				-- base04 = "#161618",
				-- base03 = "#080809",
				-- base04 = "#080809",
			}
		end,
		-- highlights = function(colors)
		-- 	return {
		-- 		Normal = { fg = colors.fg, bg = colors.bg },
		-- 	}
		-- end,
		palette = "solarized", -- solarized (default) | selenized
		variant = "summer", -- "spring" | "summer" | "autumn" | "winter" (default)
		error_lens = {
			text = false,
			symbol = false,
		},
		styles = {
			-- types = { italic = true },
			-- functions = { italic = true },
			parameters = {},
			-- comments = { italic = true },
			strings = {},
			-- keywords = { italic = true },
			variables = { italic = true },
			constants = { underline = true },
		},
		plugins = {
			treesitter = true,
			lspconfig = true,
			navic = true,
			cmp = true,
			indentblankline = true,
			neotree = true,
			nvimtree = true,
			whichkey = true,
			dashboard = true,
			gitsigns = true,
			telescope = true,
			noice = true,
			hop = true,
			ministatusline = true,
			minitabline = true,
			ministarter = true,
			minicursorword = true,
			notify = true,
			rainbowdelimiters = true,
			bufferline = true,
			lazy = true,
			rendermarkdown = true,
			ale = true,
			coc = true,
			leap = true,
			alpha = true,
			yanky = true,
			gitgutter = true,
		},
	})
	local lsp_config = require("lspconfig")
	lsp_config.lua_ls.setup({
		settings = {
			Lua = {
				hint = {
					enable = true,
				},
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = true,
					library = {
						vim.env.VIMRUNTIME,
						"~/.local/share/nvim/lazy/solarized.nvim",
					},
				},
			},
		},
	})

	vim.cmd("colorscheme solarized")
	vim.cmd("hi StatusLine guifg=#003742 guibg=#7C9596")
end

return M
