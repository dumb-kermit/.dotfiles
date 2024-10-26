local map = vim.keymap.set

vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<A-.>", "<C-\\><C-n>", { desc = "RETURN NVIM/TERM" })

-- map("n", "n", 'n:lua require("func").flash_cursorline()<CR><CR>')
-- map("n", "N", 'N:lua require("func").flash_cursorline()<CR><CR>')

-- Diagnostic keymaps --
-- map("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- map("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- map("n", "<leader>em", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- map("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Movement --
map("n", "<S-a>", "0", { desc = "JUMP > 3W LEFT" })
map("n", "<S-d>", "$", { desc = "JUMP < 3W RIGHT" })
map("n", "<S-w>", "{", { desc = "JUMP 3L UP" })
map("n", "<S-s>", "}", { desc = "JUMP 3L DOWN" })
map("n", "w", "k", { noremap = true, desc = "JUMP 3L UP" })
map("n", "s", "j", { noremap = true, desc = "JUMP 3L DOWN" })
map("n", "a", "h", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "d", "l", { noremap = true, desc = "JUMP < 3W RIGHT" })
map("n", "<D-a>", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "<D-d>", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })

map("n", "r", "dw", { desc = "  DELETE" })
map({ "n", "x", "o" }, "<enter>", "<Plug>(leap)", { desc = "INIT LEAP" })
-- map("n", "<A-d>", ":bnext<CR>", { desc = "BUFFR NEXT" })
-- map("n", "<A-a>", ":bprev<CR>", { desc = "BUFFR PREV" })
-- map("n", "<A-w>", ":bd<CR>", { desc = "BUFFR EXIT" })
-- map("n", "<S-Right>", ":bnext<CR>", { desc = "BUFFR NEXT" })
-- map("n", "<S-Left>", ":bprev<CR>", { desc = "BUFFR PREV" })
-- map("n", "<C-x>", "<cmd>lua MiniBufremove.unshow()<CR>", { desc = " Minify Buffer" })

-- Menuing --
map("n", "<F12>", "<cmd>lua MiniStarter.open()<CR>", { desc = "RETURN DASHBOARD" })
map("n", "<C-Space>", "<cmd>lua MiniStarter.open()<CR>", { desc = "RETURN DASHBOARD" })
map("n", "<D-l>", "<cmd>Lazy<CR>", { desc = "RETURN LAZY-NVIM" })
map("n", "<S-f>", "<cmd>Lf<CR>", { desc = "RETURN LF-TERM" })
map("n", "<D-a>", "<cmd>bprev<CR>", { desc = "BUFFER PREV" })
map("n", "<D-d>", "<cmd>bnext<CR>", { desc = "BUFFER NEXT" })
map("n", "<C-a>", "<cmd>bprev<CR>", { desc = "BUFFER PREV" })
map("n", "<C-d>", "<cmd>bnext<CR>", { desc = "BUFFER NEXT" })
map("n", "<D-s>", "<cmd>bd!<CR>", { desc = "BUFFER KILL" })
map("n", "<D-c>", "<cmd>write!<CR>", { desc = "BUFFER SAVE" })
-- map("n", "<S-Backspace>", "<cmd>bd!<CR>", { desc = "BUFFER KILL" })

-- Telescope --
map("n", "<leader>th", "<cmd>Telescope help_tags<CR>", { desc = "TELESCOPE: HELP-FILES" })
map("n", "<leader>tk", "<cmd>Telescope keymaps<CR>", { desc = "TELESCOPE: KEYMAPS" })
-- map("n", "<F10>", ":lua require('telescope').extensions.projects.projects()<CR>", { desc = "TELESCOPE: PROJECTS" })
-- map("n", "<leader>s", "<cmd>Telescope<CR>", { desc = " SCOPE PICKERS" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "TELESCOPE: FILES" })
-- map("n", "<leader>o", "<cmd>Telescope noice<CR>", { desc = " SCOPE NOICE" })
-- map("n", "<leader>w", "<cmd>Telescope grep_string<CR>", { desc = " SCOPE CURWORD" })
-- map("n", "<leader>a", "<cmd>Telescope diagnostics<CR>", { desc = " SCOPE DIAG" })
-- map("n", "<leader>m", "<cmd>Telescope marks<CR>", { desc = " SCOPE MARKS" })
map("n", "<F2>", "<cmd>Telescope oldfiles<CR>", { desc = "TELESCOPE: RECENTS" })
map("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "TELESCOPE: UNDO-TREE" })
map("n", "<F3>", "<cmd>Telescope buffers<CR>", { desc = "TELESCOPE: BUFFERS" })
-- map("n", "<tab>", "<cmd>Telescope reloader<CR>", { desc = " SCOPE RELOADER" })
map("n", "<leader>tl", "<cmd>Telescope highlights<CR>", { desc = "TELESCOPE: HIGHLIGHTS" })
map("n", "<leader>tc", "<cmd>Telescope commands<CR>", { desc = "TELESCOPE: OPTIONS" })
-- map("n", "<leader>z", function()
-- 	local builtin = require("telescope.builtin")
-- 	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
-- 		winblend = 10,
-- 		previewer = true,
-- 	}))
-- end, { desc = " SCOPE FUZZY" })
map("n", "<F1>", function()
	local builtin = require("telescope.builtin")
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "TELESCOPE: VIM-CONFIG" })

-- -- OSX Clip --
-- map("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
-- map("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- map("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- map("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- LSP --
local function hide_diagnostics()
	vim.diagnostic.config({ -- https://neovim.io/doc/user/diagnostic.html
		virtual_text = false,
		signs = false,
		underline = false,
	})
end
local function show_diagnostics()
	vim.diagnostic.config({
		underline = true,
		virtual_text = true,
		virtual_text = true,
	})
end
vim.keymap.set("n", "<leader>l", hide_diagnostics, { desc = "KILL LSPDIAG" })
vim.keymap.set("n", "<leader>L", show_diagnostics, { desc = "INIT LSPDIAG" })

-- YANKY --
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
map("", "<D-v>", "<Plug>(YankyPutBefore)", { noremap = true, silent = true })
map("n", "<D-v>", "<Plug>(YankyPutBefore)", { noremap = true, silent = true })
map("i", "<D-v>", "<Plug>(YankyPutBefore)", { noremap = true, silent = true })
map("n", "<leader>a", "viw", { desc = "SELECT CURWORD" })
map("n", "<leader>v", "<C-v>", { desc = "Enter V-BLOCK" })
