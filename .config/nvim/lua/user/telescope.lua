local M = {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		"debugloop/telescope-undo.nvim",
		{ "jvgrootveld/telescope-zoxide", dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" } },
	},
}

function M.config()
	require("telescope.pickers.layout_strategies").horizontal_merged = function(
		picker,
		max_columns,
		max_lines,
		layout_config
	)
		local layout =
			require("telescope.pickers.layout_strategies").horizontal(picker, max_columns, max_lines, layout_config)

		layout.prompt.title = ""
		layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

		layout.results.title = ""
		layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
		layout.results.line = layout.results.line - 1
		layout.results.height = layout.results.height + 1

		layout.preview.title = ""
		layout.preview.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

		return layout
	end
	--  local wk = require "which-key"
	--  wk.register {
	--    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
	--    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	--    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	--    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
	--    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	--    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
	--    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
	--    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
	--    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
	--  }

	local icons = require("user.icons")
	local actions = require("telescope.actions")
	local z_utils = require("telescope._extensions.zoxide.utils")
	local t = require("telescope")

	require("telescope").setup({
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = true,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			-- file_sorter = require("telescope.sorters").get_fuzzy_file,
			-- file_ignore_patterns = { "node_modules" },
			-- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			-- path_display = { "truncate" },
			winblend = 0,
			-- border = {},
			-- borderchars = {
			--     -- prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			--     results = { " " },
			--     preview = { " " },
			-- },
			-- borderchars = { "", "", "", "", "", "", "", "" },
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			-- borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = false,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			undo = {
				use_delta = true,
				use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
				side_by_side = true,
				diff_context_lines = vim.o.scrolloff,
				entry_format = "state #$ID, $STAT, $TIME",
				time_format = "%H:%M:%s",
				saved_only = false,
			},
			zoxide = {
				prompt_title = "[ Walking on the shoulders of TJ ]",
				mappings = {
					default = {
						after_action = function(selection)
							print("Update to (" .. selection.z_score .. ") " .. selection.path)
						end,
					},
					["<C-s>"] = {
						before_action = function(selection)
							print("before C-s")
						end,
						action = function(selection)
							vim.cmd.edit(selection.path)
						end,
					},
					-- Opens the selected entry in a new split
					["<C-q>"] = { action = z_utils.create_basic_command("split") },
				},
			},
		},
	})
	require("telescope").load_extension("zoxide")
	vim.keymap.set("n", "<leader>z", t.extensions.zoxide.list)
	-- require("telescope.builtin").buffers({
	-- ...
	-- entry_maker = require("user.buffers").gen_from_buffer_like_leaderf(),
	-- })
	-- require("user.telescopelayout")
end

return M
