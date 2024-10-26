-- Eviline config for lualine
-- Author: sadgrog
local lualine = require "lualine"

-- Color table for highlights
-- local colors = require("theme").colors

-- local colors = {
    -- red = require("base16-colorscheme").colors.base08,
    -- yellow = require("base16-colorscheme").colors.base0A,
    -- green = require("base16-colorscheme").colors.base0B,
    -- cyan = require("base16-colorscheme").colors.base0C,
    -- blue = require("base16-colorscheme").colors.base0D,
    -- purple = require("base16-colorscheme").colors.base0E,
    -- gray = require("base16-colorscheme").colors.base04,
    -- fg = require("base16-colorscheme").colors.base07,
    -- bg = require("base16-colorscheme").colors.base00,
-- }
-- local colors = {
    -- cyan = "#89b482",
    -- green = "#a9b665",
    -- red = "#ea6962",
    -- magenta = "#d3869b",
    -- blue = "#7daea3",
    -- bg = "#1d2021",
    -- fg = "#d4be98",
    -- cmd = "#e78a4e",
    -- gray = "#958272",
    -- white = "#d4be98",
    -- checker = "#d8a657",
    -- primer = "#a9b665",
    -- shade = "#514944",
-- }
-- local colors = {
        -- red = "#442b2b",
        -- yellow = "#bd976a",
        -- green = "#80a665",
        -- cyan = "#4c9a91",
        -- blue = "#5eaab5",
        -- purple = "#458469",
        -- gray = "#252525",
        -- fg = "#8a8b8c",
        -- bg = "#121212",
-- }
--
-- local colors = {
    -- red = "#fc5452",
    -- yellow = "#c78b39",
    -- green = "#71ad71",
    -- blue = "#62a496",
    -- purple = "#d8748e",
    -- cyan = "#699f69",
    -- bg = "#242424",
    -- fg = "#c6aa80",
    -- gray = "#877465"
-- }

-- stylua: ignore

-- Icon Graveyard
-- error = "􀃂 ", warn = "􀃮 ", info = "􁊇 ", hint = "􀃬 " ▊" ▊  ▊" ""􀵬 "  -- icon = "  ", -- icon = " ",-- icon = " ",-- icon = "􀤭 ",-- icon = " ",-- icon = "􀉤 ",-- icon = "􀤏 ",-- icon = "􁓔 ",-- icon = "LSP",

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.red, bg = colors.bg } },
            inactive = { c = { fg = colors.gray, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- ins_left {
--     function()
--         return "▊"
--     end,
--     color = { fg = colors.cyan, bg = "none" },
--     -- color = { fg = colors.yellow, bg = colors.bg }, -- Sets highlighting of component
--     padding = { left = 0.5 }, -- We don't need space before this
-- }

ins_left {
    -- mode component
    function()
        return "􀙬 "
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.yellow,
            i = colors.green,
            v = colors.cyan,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.red,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.magenta,
            Rv = colors.magenta,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    -- padding = { left = 0.5 }, -- We don't need space before this
    -- padding = { left = 1.5, right = 1.5 },
}

ins_left {
    "filesize",
    cond = conditions.buffer_not_empty,
    fmt = string.upper,
    color = { fg = colors.shade, gui = "bold" },
}

ins_left {
    "filename",
    cond = conditions.buffer_not_empty,
    fmt = string.upper,
    color = { fg = colors.yellow, gui = "bold" },
}

-- ins_left {
-- "fileformat",
-- fmt = string.upper,
-- icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
-- color = { fg = colors.gray, gui = "bold" },
-- }

ins_left {
    "o:encoding", -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    -- icons_enabled = true,
    color = { fg = colors.shade, gui = "bold" },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_right {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = "$", warn = "!", info = "#", hint = "?" },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.green },
        color_info = { fg = colors.cyan },
        color_hint = { fg = colors.white },
    },
}

ins_left {
    "buffers",
    -- fmt = string.upper,
    show_filename_only = true, -- Shows shortened relative path when set to false.
    hide_filename_extension = false, -- Hide filename extension when set to true.
    show_modified_status = false, -- Shows indicator when the buffer is modified.

    mode = 1,
    -- 0: Shows buffer name
    -- 1: Shows buffer index
    -- 2: Shows buffer name + buffer index
    -- 3: Shows buffer number
    -- 4: Shows buffer name + buffer number

    max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
    -- it can also be a function that returns
    -- the value of `max_length` dynamically.
    filetype_names = {
        TelescopePrompt = "SCOPE",
        dashboard = "Dashboard",
        packer = "Packer",
        fzf = "FZF",
        alpha = "Alpha",
        Lazy = "LAZY",
    }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

    -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
    -- use_mode_colors = true,

    symbols = {
        modified = "●", -- Text to show when the buffer is modified
        alternate_file = "", -- Text to show to identify the alternate file
        directory = "", -- Text to show when the buffer is a directory
    },
    icons_enabled = false,
    color = { fg = colors.white, gui = "bold" },
}

ins_left {
    function()
        return "%="
    end,
}

ins_left {
    function()
        local noice = require "noice"
        local msg = noice.api.status.message.get()
        local has = require("noice").api.status.message.has
        if has ~= nil then
            return msg
        end
    end,
    icon = "󰀫 ",
    color = { fg = colors.red, gui = "bold" },
    fmt = string.upper,
}

ins_right {
    function()
        -- local msg = "[OFF]"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        -- local msg2 = "[ON]"
        local msg2 = " ON"
        local msg = " OFF"
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return msg2
            end
        end
        return msg
    end,
    fmt = string.upper,
    color = { fg = colors.shade, gui = "bold" },
}

ins_right {
    function()
        local noice = require "noice"
        local kp = noice.api.status.command.get()
        -- local haskp = require("noice").api.status.command.has
        if package.loaded["noice"] then
            -- if haskp ~= nil then
            return kp
        end
    end,
    icon = "󰌋",
    color = { fg = colors.shade, gui = "bold" },
    fmt = string.upper,
}

-- ins_right { "location", icon = "􀯪 ", color = { fg = colors.shade, gui = "bold" } }
ins_right { "location", icon = "", color = { fg = colors.cyan, gui = "bold" } }

ins_right {
    "datetime",
    icon = "󰥔",
    style = "%r",
    color = { fg = colors.yellow, gui = "bold" },
    fmt = string.upper,
    -- padding = { right = 0.5 },
}

-- ins_right {
--     "branch",
--     icon = "",
--     color = { fg = colors.magenta, gui = "bold" },
-- }
--
-- ins_right {
--     "diff",
--     -- Is it me or the symbol for modified is really weird
--     symbols = { added = " ", modified = "󰝤 ", removed = " " },
--     diff_color = {
--         added = { fg = colors.green },
--         modified = { fg = colors.orange },
--         removed = { fg = colors.red },
--     },
--     cond = conditions.hide_in_width,
-- }

-- ins_right {
--     function()
--         return "▊"
--     end,
--     color = { fg = colors.cyan, bg = colors.bg },
--     padding = { right = 0.5 },
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
