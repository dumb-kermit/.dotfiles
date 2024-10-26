-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.cmd("let base16colorspace=256")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 0

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "nosplit"

-- Show which line your cursor is onopt
vim.opt.cursorlineopt = "number"
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "both"

-- Minimal number of screen lines to keep above and below the cursor.
-- Best practice is to keep it middle of the screen always -- actually it can be done by setting an n+x value, where x is higher than total number of lines on the screen at any time;
--vim.opt.scrolloff = 30
vim.opt.scrolloff = 11
--vim.opt.scrolloff = 22
--vim.opt.scrolloff = 100

-- Additional Stuff merged by Me
vim.opt.autowrite = true  -- Enable auto write
vim.opt.laststatus = 3    -- global statusline
vim.opt.pumheight = 10    -- Maximum number of entries in a popup
vim.opt.shiftround = true -- Round indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.splitkeep = "screen"
-- vim.opt.termguicolors = true
-- vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false    -- Disable line wrap
vim.opt.cmdheight = 1
vim.opt.tabstop = 8
vim.opt.ttimeoutlen = 30
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mousescroll = "ver:1,hor:0"
-- vim.cmd "set guicursor=a:blinkwait1-blinkoff200-blinkon200"
vim.g.virtualtextcolor = true
-- vim.opt.fillchars:append { eob = " " }
vim.opt.fillchars:append({ eob = " " })
vim.opt.showtabline = 1
--vim.opt.syntax = enabled
--vim.opt.signcolumn = "yes:1"
vim.opt.signcolumn = "number"
vim.opt.numberwidth = 1
-- vim.cmd "set guicursor=a:ver4"
-- vim.cmd "set guicursor=a:block"
-- vim.cmd "set guicursor=a:hor2"

vim.opt.guicursor = {
    "n-v:block",
    "i-c-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
    "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.cmd("hi Cursor guibg=#d0a215 guifg=#100f0f")

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

if vim.fn.has("nvim-0.10") == 1 then
    vim.opt.smoothscroll = true
end
vim.api.nvim_set_hl(0, "Variables", { underline = true })
vim.api.nvim_set_hl(0, "Numbers", { underline = true })
vim.api.nvim_set_hl(0, "@variables", { underline = true })
vim.api.nvim_set_hl(0, "@numbers", { underline = true })

if vim.g.neovide then
    require("config.neovide")
end
vim.cmd("let base16colorspace=256")
vim.cmd("set syntax=on")

require("config.neovide")
-- Fatter Winbar
vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}

-- LEAP --
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
vim.api.nvim_set_hl(0, "LeapMatch", {
    -- For light themes, set to 'black' or similar.
    fg = "white",
    bold = true,
    nocombine = true,
})

-- Lightspeed colors
-- primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
-- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
-- shortcuts: bg = "#f00077", fg = "white"
-- You might want to use either the primary label or the shortcut colors
-- for Leap primary labels, depending on your taste.
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
    fg = "red",
    bold = true,
    nocombine = true,
})
vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
    fg = "blue",
    bold = true,
    nocombine = true,
})
