-- Credits to original https://github.com/morhetz/gruvbox
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#C1A47A",
  darker_black = "#232323",
  black = "#1d2021", --  nvim bg
  black2 = "#1d2021",
  one_bg = "#1d2021",
  one_bg2 = "#1d2021",
  one_bg3 = "#1d2021",
  grey = "#4b4b4b",
  grey_fg = "#666565",
  grey_fg2 = "#606060",
  light_grey = "#656565",
  red = "#C51E14",
  baby_pink = "#fb4934",
  pink = "#fb4934",
  line = "#1d2021", -- for lines like vertsplit
  green = "#98971a",
  vibrant_green = "#b8bb26",
  nord_blue = "#83a598",
  blue = "#458588",
  yellow = "#d79921",
  sun = "#fe9019",
  purple = "#d3869b",
  dark_purple = "#b16286",
  teal = "#8ec07c",
  orange = "#d65d0e",
  cyan = "#689d6a",
  statusline_bg = "#1d2021",
  lightbg = "#1d2021",
  pmenu_bg = "#1d2021",
  folder_bg = "#1d2021",
}

M.base_16 = {
  base00 = "#1C2021",
  base01 = "#3c3836",
  base02 = "#504955",
  base03 = "#666565",
  base04 = "#9a99a3",
  base05 = "#C1A47A",
  base06 = "#ebdbb2",
  base07 = "#fbf1c7",
  -- base08 = "#C51E14",
  base08 = "#9D0006",
  -- base09 = "#fe8019",
  base09 = "#AF3A02",
  base0A = "#d79921",
  -- base0B = "#98971a",
  -- base0C = "#689d6a",
  base0B = "#79740E",
  base0C = "#427B58",
  base0D = "#458588",
  -- base0E = "#d3869b",
  base0E = "#8F3F71",
  base0F = "#d65d0e",
}

M.type = "dark"

M = require("base46").override_theme(M, "gruvbox")

M.polish_hl = {
  syntax = {
    Operator = { fg = M.base_30.nord_blue },
  },

  treesitter = {
    ["@operator"] = { fg = M.base_30.nord_blue },
  },
}

return M
