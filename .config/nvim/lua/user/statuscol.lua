local M = {
	"luukvbaal/statuscol.nvim",
	event = "BufReadPost",
}

function M.config()
	local builtin = require("statuscol.builtin")
	require("statuscol").setup({
		relculright = true,
		ft_ignore = {
			"man",
			"starter",
			"TelescopePrompt",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dashboard",
			"NvimTree",
		},
		segments = {
			-- Diagnostics
			{
				sign = { name = { "Diagnostic" }, maxwidth = 2, auto = false },
				click = "v:lua.ScSa",
			},
			{
				text = { builtin.lnumfunc },
				condition = { true, builtin.not_empty },
			},
			{
				sign = {
					name = { ".*" },
					maxwidth = 1,
					colwidth = 1,
					wrap = true,
				},
			},
		},
	})
	vim.opt.signcolumn = "yes"
	-- vim.o.foldcolumn = "1"
	-- vim.o.foldlevel = 99
	-- vim.o.foldlevelstart = 99
	-- vim.o.foldenable = true
end
return M
