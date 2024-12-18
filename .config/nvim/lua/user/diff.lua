local M = {
	"echasnovski/mini.diff",
	version = false,
	event = "BufReadPre",
}

function M.config()
	-- require("mini.diff").setup()
	local diff = require("mini.diff")
	require("mini.diff").setup({
		-- Options for how hunks are visualized
		-- view = {
		-- Visualization style. Possible values are 'sign' and 'number'.
		-- Default: 'number' if line numbers are enabled, 'sign' otherwise.
		--style = 'sign',

		-- Signs used for hunks with 'sign' view
		view = {
			style = "sign",
			signs = {
				-- 	add = "ADD",
				-- 	change = "UPD",
				-- 	delete = "DEL",
				-- signs = {
				-- add = "􀁍 ",
				-- change = "􀘝 ",
				-- delete = "􀁏 ",
				-- add = "▒▒",
				-- change = "▒▒",
				-- delete = "▒▒",
				add = " ",
				change = " ✱",
				delete = " ",
				-- add = "",
				-- change = "",
				-- delete = "",
				-- add = "+",
				-- change = "=",
				-- delete = "-",
				-- add = "􁂇 ",
				-- change = "􁂆 ",
				-- delete = "􀅌 ",
			},
			-- Priority of used visualization extmarks
			priority = 999, -- don't see any signs
		},
		-- edit this place
		-- Source for how reference text is computed/updated/etc
		-- Uses content from Git index by default
		source = diff.gen_source.save(),
		--yeah this moment

		-- Delays (in ms) defining asynchronous processes
		delay = {
			-- How much to wait before update following every text change
			text_change = 5,
		},
		-- Module mappings. Use `''`-- (empty string) to disable one.
		mappings = {
			-- Apply hunks inside a visual/operator region
			apply = "gh",

			-- Reset hunks inside a visual/operator region
			reset = "gH",

			-- Hunk range textobject to be used inside operator
			textobject = "gh",

			-- Go to hunk range in corresponding direction
			goto_first = "[H",
			goto_prev = "[h",
			goto_next = "]h",
			goto_last = "]H",
		},
		options = {
			-- Diff algorithm. See `:h vim.diff()`.
			algorithm = "histogram",

			-- Whether to use "indent heuristic". See `:h vim.diff()`.
			indent_heuristic = true,

			-- The amount of second-stage diff to align lines (in Neovim>=0.9)
			linematch = 60, --ugh pls

			-- Whether to wrap around edges during hunk navigation
			wrap_goto = false,
		},
	})
	vim.cmd("hi MiniDiffSignAdd guifg=#D39501")
	vim.cmd("hi MiniDiffSignChange guifg=#78834B")
end
return M
