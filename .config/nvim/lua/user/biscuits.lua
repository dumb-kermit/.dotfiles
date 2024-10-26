local M = {
        	"code-biscuits/nvim-biscuits",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
    }

function M.config()
			require("nvim-biscuits").setup({
				cursor_line_only = true,
				show_on_start = true,
				min_distance = 1,
			})
end 
return M
