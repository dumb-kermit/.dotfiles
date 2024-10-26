local M = {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	event = "UiEnter",
}

function M.config()
	vim.g.moonflyCursorColor = true
	vim.g.moonflyNormalFloat = true
	vim.g.moonflyUnderlineMatchParen = true
	vim.g.moonflyVirtualTextColor = true
	vim.g.moonflyWinSeparator = 2
	vim.opt.fillchars = {
		horiz = "━",
		horizup = "┻",
		horizdown = "┳",
		vert = "┃",
		vertleft = "┫",
		vertright = "┣",
		verthoriz = "╋",
	}
	vim.cmd([[colorscheme moonfly]])

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
		border = "single",
	})
	vim.diagnostic.config({ float = { border = "single" } })

	local winhighlight = {
		winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
	}
	-- require("cmp").setup({
	-- 	window = {
	-- 		completion = cmp.config.window.bordered(winhighlight),
	-- 		documentation = cmp.config.window.bordered(winhighlight),
	-- 	},
	-- })
end
return M
