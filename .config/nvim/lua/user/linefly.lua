local M = {
	"bluz71/nvim-linefly",
	event = "UiEnter",
}

function M.config()
	vim.g.linefly_options = {
		tabline = true,
		with_attached_clients = false,
		with_macro_status = true,
		with_search_count = true,
		with_indent_status = true,
		with_lsp_status = true,
	}
end
return M
