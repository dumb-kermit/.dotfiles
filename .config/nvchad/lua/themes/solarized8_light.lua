-- Credits to original https://github.com/craftzdog/solarized-osaka.nvim
-- This is a modified version of it

---@type Base46Table
local M = {}

M.base_30 = {
  white = "#657B83",
  darker_black = "#002B36",
  black = "#fdf6e3",
  black2 = "#fdf6e3",
  one_bg = "#fdf6e3",
  one_bg2 = "#fdf6e3",
  one_bg3 = "#044A67",
  grey = "#405055",
  grey_fg = "#47585E",
  grey_fg2 = "#4F6369",
  light_grey = "#93A1A1",
  red = "#c51e14",
  baby_pink = "#D33682",
  pink = "#849900",
  line = "#47585E",
  green = "#859900",
  vibrant_green = "#bad600",
  -- nord_blue = "#1a6397",
  -- blue = "#268bd3",
  nord_blue = '#519ABA',
  blue = '#1a6397',
  yellow = "#B58900",
  sun = "#e6ac00",
  purple = "#6C71C4",
  dark_purple = "#575ea2",
  teal = "#849900",
  orange = "#CB4B16",
  cyan = "#2AA198",
  statusline_bg = "#47585E",
  lightbg = "#eee8d5",
  pmenu_bg = "#eee8d5",
  folder_bg = "#eee8d5",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.one_bg,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = "#fbf3db",
  base05 = M.base_30.white,
  base06 = "#fbf3db",
  base07 = "#fdf6e3",
  base08 = "#268bd2",
  base09 = "#268BD2",
  base0A = "#b28500",
  base0B = "#2AA198",
  base0C = "#CB4B16",
  base0D = "#268bd2",
  base0E = "#859900",
  base0F = "#C51E14",
}

M.polish_hl = {
  treesitter = {
    ["@constant"] = { fg = "#29a298" }, -- could be deleted if #284 get merged
    ["@operator"] = { fg = "#849900" },
    ["@variable.parameter"] = { fg = "#c94c16" },
    ["@function.builtin"] = { fg = "#c94c16" },
  },

  syntax = {
    Include = { fg = "#849900" },
    Tag = { fg = "#849900" },
  },

  defaults = {
    IncSearch = { fg = "#c94c16", bg = "none", standout = true },
  },

  lsp = {
    DiagnosticVirtualTextError = { bg = "#570f0e", fg = M.base_30.red },
    DiagnosticVirtualTextWarn = { bg = "#332700", fg = M.base_30.yellow },
    DiagnosticVirtualTextInfo = { bg = "#0f3856", fg = M.base_30.blue },
    DiagnosticVirtualTextHint = { bg = "#103a3c", fg = M.base_30.purple },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "solarized_osaka")

return M
