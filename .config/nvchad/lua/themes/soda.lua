-- Credits to original https://github.com/altercation/solarized
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#b1c1e1",
  darker_black = "#1A1A1A",
  black = "#1A1A1A", --  nvim bg
  black2 = "#1A1A1A",
  one_bg = "#1A1A1A", -- real bg of onedark
  one_bg2 = "#1A1A1A",
  one_bg3 = "#1A1A1A",
  -- grey = "#28535e",
  -- grey_fg = "#325d68",
  grey = "#707070",
  grey_fg = "#707070",
  grey_fg2 = "#625E4C",
  light_grey = "#625E4C",
  red = "#F4005F",
  baby_pink = "#F4005F",
  pink = "#d33682",
  line = "#1A1A1A", -- for lines like vertsplit
  green = "#98E024",
  vibrant_green = "#98E024",
  nord_blue = "#F4005F",
  blue = "#F4005F",
  yellow = "#FA8419",
  sun = "#E0D561",
  purple = "#9D65FF",
  dark_purple = "#9D65FF",
  teal = "#58D1EB",
  orange = "#cb4b16",
  cyan = "#58D1EB",
  -- statusline_bg = "#042f3a",
  statusline_bg = "#1A1A1A",
  lightbg = "#1C1B19",
  pmenu_bg = "#1A1A1A",
  folder_bg = "#1A1A1A",
}

M.base_16 = {
  base00 = "#1A1A1A",
  base01 = "#06313c",
  base02 = "#0a3540",
  base03 = "#133e49",
  base04 = "#1b4651",
  base05 = "#b1c1e1",
  base06 = "#b1c1e1",
  base07 = "#b1c1e1",
  base08 = "#dc322f",
  base09 = "#cb4b16",
  base0A = "#b58900",
  base0B = "#859900",
  base0C = "#2aa198",
  base0D = "#268bd2",
  base0E = "#6c71c4",
  base0F = "#d33682",
}

M.type = "dark"

M = require("base46").override_theme(M, "solarized_dark")

return M
