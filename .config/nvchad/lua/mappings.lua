require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "w", "k", { noremap = true, desc = "JUMP 3L UP" })
map("n", "s", "j", { noremap = true, desc = "JUMP 3L DOWN" })
map("n", "a", "h", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "d", "l", { noremap = true, desc = "JUMP < 3W RIGHT" })
map("n", "<D-a>", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "<D-d>", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })

map("n", "<S-a>", "0", { desc = "JUMP > 3W LEFT" })
map("n", "<S-d>", "$", { desc = "JUMP < 3W RIGHT" })
map("n", "<S-w>", "{", { desc = "JUMP 3L UP" })
map("n", "<S-s>", "}", { desc = "JUMP 3L DOWN" })

map("n", "r", "dw", { desc = "Delete" })

map("n", "<C-Space>", "<cmd>Nvdash<CR>", { desc = "Return to Dashboard" })
map("n", "<S-f>", "<cmd>Lf<CR>", { desc = "Escape to LF-TERM" })
map("n", "<D-a>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<D-d>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-a>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<C-d>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<D-s>", "<cmd>bd!<CR>", { desc = "Hide current buffer" })
map("n", "<D-l>", "<cmd>Lazy<CR>", { desc = "Hide " })
map("n", "<S-c>", "gcc" )

map("n", "<F1>", function()
  local builtin = require("telescope.builtin")
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope: NVIM-config" })
map("n", "<F2>", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope: Recents" })
map("n", "<F3>", "<cmd>Telescope buffers<CR>", { desc = "Telescope: Buffers" })

-- Keyboard users
map("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
