local M = {
	"ofirgall/ofirkai.nvim",
	branch = "exp",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme ofirkai")
	-- vim.cmd "hi CursorLineNr guifg=#AE81FF guibg=#1A1A1A"
	-- vim.cmd "hi LineNr guifg=#75715E guibg=#1A1A1A"
	-- vim.cmd "hi Comment guifg=#75715E cterm=italic gui=italic"
	-- vim.cmd "hi NoiceCmdlinePopupBorder guifg=#A6E22E guibg=#1A1A1A"
	-- vim.cmd "hi NoiceCmdlineIcon guifg=#AE81FF guibg=#1A1A1A"
	-- vim.cmd "hi @comment guifg=#75715E cterm=italic gui=italic"
	-- vim.cmd "hi @property guifg=#FD971F"
	-- vim.cmd "hi Constant guifg=#AE81FF"
	-- vim.cmd "hi String guifg=#AE81FF cterm=italic gui=italic"
	-- vim.cmd "hi WhichKeyBorder guibg=#1A1A1A guifg=#AE81FF"
	-- vim.cmd "hi WhichkeyNormal guibg=#1A1A1A"
	-- vim.cmd "hi Normal guibg=#1A1A1A"
	local lspkind = require("lspkind")

	require("cmp").setup({
		window = require("ofirkai.plugins.nvim-cmp").window, -- I just removed the `FloatBorder:Normal` from the highlights to allow the FloatBorder to be colored, its not a must.

		-- Get lsp icons from ofirkai, requires https://github.com/onsails/lspkind.nvim
		formatting = {
			format = lspkind.cmp_format({
				symbol_map = require("ofirkai.plugins.nvim-cmp").kind_icons,
				maxwidth = 50,
				mode = "symbol",
			}),
		},
	})

	require("noice").setup({
		popupmenu = {
			enabled = false, -- I prefer nvim-cmp
		},
		lsp = {
			signature = {
				enabled = false, -- I prefer to use ray-x/lsp_signature.nvim with minimal design
			},
			override = {
				-- Override `vim.lsp.buf.hover` and `nvim-cmp` doc formatter with `noice` doc formatter.
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	})
end

return M
