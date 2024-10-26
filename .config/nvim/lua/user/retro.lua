local M = {
	"maxmx03/fluoromachine.nvim",
	event = "UiEnter",
}

function M.config()
	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"~/.local/share/nvim/lazy/fluoromachine.nvim",
					},
				},
				hint = {
					enable = true,
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
		capabilities = capabilities,
	})
	---@type fluoromachine
	local fm = require("fluoromachine")
	function overrides(c, color)
		local darken = color.darken
		local lighten = color.lighten
		local blend = color.blend
		local shade = color.shade
		local tint = color.tint
		return {
			TelescopeResultsBorder = { fg = c.bgdark, bg = c.bgdark },
			TelescopeResultsNormal = { bg = c.bgdark },
			TelescopePreviewNormal = { bg = "#241B2F" },
			TelescopePromptBorder = { fg = c.bgdark, bg = c.bgdark },
			TelescopeTitle = { fg = "#FFCC01", bg = shade(c.red, 5) },
			TelescopePromptPrefix = { fg = "#FFCC01" },
			TelescopePreviewBorder = { fg = "#241B2F", bg = "#241B2F" },
			TelescopeNormal = { fg = "#f8f8f8", bg = "#241B2F" },
			TelescopeSelection = { fg = "#FFCC01", bg = "#241B2F" },
			TelescopeSelectionCaret = { fg = "#FFCC01", bg = "#241B2F" },
		}
	end

	fm.setup({
		glow = false,
		theme = "retrowave",
		transparent = false,
		-- plugins = {
		-- neotree = false,
		-- },
		overrides = overrides,
	})

	vim.cmd.colorscheme("fluoromachine")
end
return M
