local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	event = "UiEnter",
}

function M.config()
	require("catppuccin").setup({
		flavour = "latte", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false, -- disables setting the background color.
		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = { "italic" },
			strings = { "italic" },
			variables = {},
			numbers = { "underline" },
			booleans = {},
			properties = { "italic" },
			types = { "italic" },
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
		color_overrides = {
			latte = {
				-- base = "#CDD3E1",
				-- base = "#e1e2e7",
				-- text = "#0e0e0e",
			},
			-- frappe = {
			-- rosewater = "#b36d43",
			-- flamingo = "#78824b",
			-- red = "#685742",
			-- maroon = "#78824b",
			-- pink = "#685742",
			-- mauve = "#5f875f",
			-- peach = "#96a6c8",
			-- yellow = "#b36d43",
			-- green = "#5f875f",
			-- teal = "#bb7744",
			-- sky = "#78824b",
			-- sapphire = "#d7c483",
			-- blue = "#78824b",
			-- lavender = "#bb7744",
			-- text = "#bebebe",
			-- subtext1 = "#d7c483",
			-- subtext0 = "#bfb3a5",
			-- overlay2 = "#aca195",
			-- overlay1 = "#958b7e",
			-- overlay0 = "#666666",
			-- surface2 = "#585858",
			-- surface1 = "#4b4b4b",
			-- surface0 = "#353535",
			-- base = "#222222",
			-- mantle = "#323232",
			-- crust = "#323232",
			-- },
		},
		custom_highlights = {
			-- latte = function(latte)
			-- 	return {
			-- StatusLine = { bg = "#E1E2EA" },
			-- }
			-- 	end,
		},
		default_integrations = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = {
				enabled = true,
				style = "nvchad",
			},
			harpoon = true,
			treesitter = true,
			which_key = true,
			notify = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			mini = {
				enabled = true,
				indentscope_color = "lavender",
			},
			dropbar = {
				enabled = true,
				color_mode = true, -- enable color for kind's texts, not just kind's icons
			},
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})

	-- setup must be called before loading
	vim.cmd.colorscheme("catppuccin")

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			package.loaded["feline"] = nil
			package.loaded["catppuccin.groups.integrations.feline"] = nil
			require("feline").setup({
				components = require("catppuccin.groups.integrations.feline").get(),
			})
		end,
	})
end

return M
