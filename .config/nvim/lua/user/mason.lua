local M = {
	"williamboman/mason-lspconfig.nvim",
	event = "BufReadPost",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		-- "tsserver",
		"pyright",
		"bashls",
		"jsonls",
		-- "shellcheck",
	}

	require("mason").setup({
		ui = {
			border = "double",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
end

return M
