local M = {
	"echasnovski/mini.comment",
	version = false,
	event = "InsertEnter",
}

M.config = function()
	require("mini.comment").setup({
		-- mappings = {
		-- 	comment = "cc",
		-- 	comment_line = "ccc",
		-- 	comment_visual = "cc",
		-- 	textobject = "cc",
		-- },
	})
end

return M
