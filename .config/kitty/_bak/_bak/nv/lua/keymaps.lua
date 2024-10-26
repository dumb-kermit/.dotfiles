local map = vim.keymap.set

vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<A-.>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- map("n", "n", 'n:lua require("func").flash_cursorline()<CR><CR>')
-- map("n", "N", 'N:lua require("func").flash_cursorline()<CR><CR>')

-- Diagnostic keymaps --
map("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>em", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "ga", "<Plug>(EasyAlign)")

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
map({ "n", "x", "o" }, "<enter>", "<Plug>(leap)", { desc = " LEAP OUT" })
-- map("n", "<A-d>", ":bnext<CR>", { desc = "BUFFR NEXT" })
-- map("n", "<A-a>", ":bprev<CR>", { desc = "BUFFR PREV" })
-- map("n", "<A-w>", ":bd<CR>", { desc = "BUFFR EXIT" })
-- map("n", "<S-Right>", ":bnext<CR>", { desc = "BUFFR NEXT" })
-- map("n", "<S-Left>", ":bprev<CR>", { desc = "BUFFR PREV" })

-- Menuing --
map("n", "<A-Space>", "<cmd>lua MiniStarter.open()<CR>", { desc = " BRING DASH" })
map("n", "<S-P>", "<cmd>Lazy<CR>", { desc = " BRING LAZY" })
map("n", "<S-l>", "<cmd>Lf<CR>", { desc = " BRING LF" })
-- map("n", "<leader>1", "<cmd>bprev<CR>", { desc = "BUFFR PREV" })
-- map("n", "<leader>2", "<cmd>bnext<CR>", { desc = "BUFFR NEXT" })
-- map("n", "<leader>3", "<cmd>bd!<CR>", { desc = "BUFFR GONE" })
-- map("n", "<leader>t", ":Themery<CR>", { desc = "BRING THEMERY" })
map("n", "<D-a>", "<cmd>bprev<CR>", { desc = "BUFFR PREV" })
map("n", "<D-d>", "<cmd>bnext<CR>", { desc = "BUFFR NEXT" })
map("n", "<D-s>", "<cmd>bd!<CR>", { desc = "BUFFR GONE" })
map("n", "<C-a>", "<cmd>bprev<CR>", { desc = "BUFFR PREV" })
map("n", "<C-d>", "<cmd>bnext<CR>", { desc = "BUFFR NEXT" })
map("n", "<C-s>", "<cmd>bd!<CR>", { desc = "BUFFR GONE" })

-- Telescope --
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = " SCOPE HELP" })
map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = " SCOPE KEYS" })
map("n", "<leader>s", "<cmd>Telescope<CR>", { desc = " SCOPE PICKERS" })
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = " SCOPE FILES" })
map("n", "<leader>o", "<cmd>Telescope noice<CR>", { desc = " SCOPE NOICE" })
map("n", "<leader>w", "<cmd>Telescope grep_string<CR>", { desc = " SCOPE CURWORD" })
map("n", "<leader>a", "<cmd>Telescope diagnostics<CR>", { desc = " SCOPE DIAG" })
map("n", "<leader>m", "<cmd>Telescope marks<CR>", { desc = " SCOPE MARKS" })
map("n", "<Tab>", "<cmd>Telescope oldfiles<CR>", { desc = " SCOPE RECENT" })
map("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = " SCOPE UNDO" })
map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = " SCOPE BUFFERS" })
-- map("n", "<tab>", "<cmd>Telescope reloader<CR>", { desc = " SCOPE RELOADER" })
map("n", "<leader>-", "<cmd>Telescope highlights<CR>", { desc = " SCOPE COLOURS" })
map("n", "<leader>?", "<cmd>Telescope commands<CR>", { desc = " SCOPE OPTS" })
map("n", "<leader>z", function()
    local builtin = require "telescope.builtin"
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy {
        winblend = 10,
        previewer = true,
    })
end, { desc = " SCOPE FUZZY" })
map("n", "<S-c>", function()
    local builtin = require "telescope.builtin"
    builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = " SCOPE CONFIG" })

-- OSX Clip --
map("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
map("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- LSP --
local function hide_diagnostics()
    vim.diagnostic.config { -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = false,
        underline = false,
    }
end
local function show_diagnostics()
    vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        underline = true,
    }
end
vim.keymap.set("n", "<leader>l", hide_diagnostics, { desc = " LSPDIAG KILL" })
vim.keymap.set("n", "<leader>L", show_diagnostics, { desc = " LSPDIAG INIT" })
