local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", lazy = true },
}

function M.config()
	-- local border = { '┏', "━", '┓', '┃', '┛', "━", '┗', '┃' }
	local border = {
		{ "╭" },
		{ "─" },
		{ "╮" },
		{ "│" },
		{ "╯" },
		{ "─" },
		{ "╰" },
		{ "│" },
	}
	-- require("user.noicehack")
	require("noice").setup({
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = {}, -- global options for the cmdline. See section on views
			---@type table<string, CmdlineFormat>
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon icon = " ",
				-- title: set to anything or empty string to hide
				-- cmdline = { title = "", pattern = "^:", icon = " ", lang = "vim" },
				-- cmdline = { title = "", pattern = "^:", icon = " ", lang = "vim" },
				-- cmdline = { title = "", pattern = "^:", icon = " ", lang = "vim" },
				cmdline = { title = "", pattern = "^:", icon = "●", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				-- search_down = { kind = "search", pattern = "^/", icon = " 􁾨 ", lang = "regex" },
				-- search_up = { kind = "search", pattern = "^%?", icon = " 􁾬 ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "􀩼 ", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				-- help = { pattern = "^:%s*he?l?p?%s+", icon = "􁌷 " },
				input = {
					-- vim = false,
				}, -- Used by input()
				-- vim = false,
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		lsp = {
			progress = {
				enabled = true,
				view = "mini",
			},
			message = {
				enabled = true,
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		messages = {
			enabled = true,
			view = "mini",
			view_error = "mini", -- view for errors
			view_warn = "mini", -- view for warnings
			view_history = "mini", -- view for :messages
		},
		popupmenu = {
			enabled = true,
			kind_icons = true,
		},
		notify = {
			enabled = true,
			view = "mini",
		},
		routes = {
			{
				filter = {
					event = "msg_showmode",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		-- routes = {
		--		routes = {
		--		{
		--			filter = {
		--				event = "lsp",
		--				kind = "progress",
		--			cond = function(message)
		--				local client = vim.tbl_get(message.opts, "progress", "client")
		--				return client == "lua_ls"
		--			end,
		--		},
		--		opts = { skip = true },
		--	},
		--			},
		-- {
		-- filter = {
		-- event = "msg_show",
		-- any = {
		-- { find = "%d+L, %d+B" },
		-- { find = "; after #%d+" },
		-- { find = "; before #%d+" },
		-- },
		-- },
		-- view = "notify",
		-- },
		views = {
			mini = {
				relative = "editor",
				align = "message-right",
				timeout = 30000,
				position = {
					-- row = -1,
					-- col = "50%",
					row = -1,
					col = "100%",
				},
				win_options = {
					winblend = 0,
				},
			},
			-- cmdline_popup = {
			-- 	relative = "editor",
			-- 	position = {
			-- 		row = 28,
			-- 		col = "50%",
			-- 	},
			-- 	size = {
			-- 		width = "auto",
			-- 		height = "auto",
			-- 	},
			-- 	border = {
			-- 		style = border,
			-- 		-- padding = { 1, 2 },
			-- 	},
			-- 	filter_options = {},
			-- 	-- win_options = {
			-- 	-- winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			-- 	-- },
			-- },
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		presets = {
			bottom_search = true,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = true,
		},
		-- },
		-- stylua: ignore
		-- keys = {
		--   { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
		--   { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
		--   { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
		--   { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
		--   { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
		--   { "<leader>snt", function() require("noice").cmd("telescope") end, desc = "Noice Telescope" },
		--   { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
		--   { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
	})
end

return M
