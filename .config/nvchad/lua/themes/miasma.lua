-- credits to original theme https://github.com/ayu-theme/ayu-vim (dark)
-- This is just a modified version of it

local M = {}

M.base_30 = {
  white = "#b1c1e1",
  darker_black = "#222222",
  black = "#222222", --  nvim bg
  black2 = "#222222",
  one_bg = "#181818",
  one_bg2 = "#222222",
  one_bg3 = "#262626",
  grey = "#646464",
  grey_fg = "#646464",
  grey_fg2 = "#646464",
  light_grey = "#54575d",
  red = "#685742",
  baby_pink = "#685742",
  pink = "#685742",
  line = "#646464", -- for lines like vertsplit
  green = "#5f875f",
  vibrant_green = "#5f875f",
  blue = "#78824B",
  nord_blue = "#78824B",
  yellow = "#B36D43",
  sun = "#B36D43",
  purple = "#bb7744",
  dark_purple = "#bb7744",
  teal = "#C9A554",
  orange = "#B36D43",
  cyan = "#C9A554",
  statusline_bg = "#222222",
  lightbg = "#262626",
  pmenu_bg = "#222222",
  folder_bg = "#222222",
}

M.base_16 = {
  base00 = "#222222",
  base01 = "#6C6D6E",
  base02 = "#24272d",
  base03 = "#404044",
  base04 = "#33363c",
  base05 = "#b1c1e1",
  base06 = "#E6E1CF",
  base07 = "#b1c1e1",
  base08 = "#E2C792",
  base09 = "#685742",
  base0A = "#b36d43",
  base0B = "#5f875f",
  base0C = "#c9a554",
  base0D = "#78824b",
  base0E = "#bb7744",
  base0F = "#918175",
}

M.polish_hl = {
  treesitter = {
    luaTSField = { fg = M.base_16.base0D },
    ["@tag.delimiter"] = { fg = M.base_30.cyan },
    ["@function"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_16.base0F },
    ["@constructor"] = { fg = M.base_16.base0A },
    ["@tag.attribute"] = { fg = M.base_30.orange },
  },
}

M = require("base46").override_theme(M, "miasma")

M.type = "dark"

return M
