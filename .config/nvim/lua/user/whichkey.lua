local M = {
	"folke/which-key.nvim",
	keys = { { "<leader>" } },
	event = { "BufReadPost", "InsertEnter", "ModeChanged", "LSPAttach" },
	-- event = "VimEnter",
	-- lazy = false,
}

function M.config()
	-- local mappings = {
	--   q = { "<cmd>confirm q<CR>", "Quit" },
	--   h = { "<cmd>nohlsearch<CR>", "NOHL" },
	--   [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
	--   v = { "<cmd>vsplit<CR>", "Split" },
	--   b = { name = "Buffers" },
	--   d = { name = "Debug" },
	--   f = { name = "Find" },
	--   g = { name = "Git" },
	--   l = { name = "LSP" },
	--   p = { name = "Plugins" },
	--   t = { name = "Test" },
	--   a = {
	--     name = "Tab",
	--     n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
	--     N = { "<cmd>tabnew %<cr>", "New Tab" },
	--     o = { "<cmd>tabonly<cr>", "Only" },
	--     h = { "<cmd>-tabmove<cr>", "Move Left" },
	--     l = { "<cmd>+tabmove<cr>", "Move Right" },
	--   },
	--   T = { name = "Treesitter" },
	-- }

	--   local which_key = require "which-key"
	--   which_key.setup {
	--     plugins = {
	--       marks = true,
	--       registers = true,
	--       spelling = {
	--         enabled = true,
	--         suggestions = 20,
	--       },
	--       presets = {
	--         operators = false,
	--         motions = false,
	--         text_objects = false,
	--         windows = false,
	--         nav = false,
	--         z = false,
	--         g = false,
	--       },
	--     },
	--     window = {
	--       border = "single",
	--       position = "bottom",
	--       padding = { 2, 2, 2, 2 },
	--     },
	--     ignore_missing = true,
	--     show_help = false,
	--     show_keys = false,
	--     disable = {
	--       buftypes = {},
	--       filetypes = { "TelescopePrompt" },
	--     },
	--   }
	--
	--   local opts = {
	--     -- mode = "n", -- NORMAL mode
	--     -- prefix = "<leader>",
	--   }
	--
	--   which_key.register(mappings, opts)
	-- end
	require("which-key").setup({
		preset = "helix",
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			-- width = 1,
			-- height = { min = 4, max = 25 },
			-- col = 0,
			-- row = math.huge,
			-- border = "none",
			padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "center",
			zindex = 1000,
			-- Additional vim.wo and vim.bo options
			bo = {},
			-- wo = {
			-- winblend = 100, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			-- },
		},
		expand = 5,
		icons = {
			colors = true,
			keys = {
				Up = "􁾩 ",
				Down = "􁾭 ",
				Left = "􁉉 ",
				Right = "􁉃 ",
				C = "􀆍 ",
				M = "􀆕 ",
				D = "􀆔 ",
				S = "􀆝 ",
				CR = "󰌑 ",
				Esc = "􀆧 ",
				ScrollWheelDown = "󱕐 ",
				ScrollWheelUp = "󱕑 ",
				NL = "󰌑 ",
				BS = "􀆛 ",
				Space = "􁁺 ",
				Tab = "􁂎 ",
				F1 = "󱊫 ",
				F2 = "󱊬 ",
				F3 = "󱊭 ",
				F4 = "󱊮 ",
				F5 = "󱊯 ",
				F6 = "󱊰 ",
				F7 = "󱊱 ",
				F8 = "󱊲 ",
				F9 = "󱊳 ",
				F10 = "󱊴 ",
				F11 = "󱊵 ",
				F12 = "󱊶 ",
			},
		},
	})
end

return M
