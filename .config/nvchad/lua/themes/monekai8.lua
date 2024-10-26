-- Credits to original theme https=//monokai.pro/
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#f7f1ff",
  darker_black = "#131313",
  black = "#191919", --  nvim bg
  black2 = "#131313",
  one_bg = "#222222", -- real bg of onedark
  one_bg2 = "#191919",
  one_bg3 = "#131313",
  grey = "#69676c",
  grey_fg = "#8b888f",
  grey_fg2 = "#525053",
  light_grey = "#bab6c0",
  red = "#fc618d",
  baby_pink = "#f98385",
  pink = "#f36d76",
  line = "#363942", -- for lines like vertsplit
  green = "#7bd88f",
  vibrant_green = "#99c366",
  nord_blue = "#81A1C1",
  blue = "#5ad4e6",
  yellow = "#fce566",
  sun = "#fd9353",
  purple = "#948ae3",
  dark_purple = "#b26fc1",
  teal = "#34bfd0",
  orange = "#d39467",
  cyan = "#5ad4e6",
  statusline_bg = "#8b888f",
  lightbg = "#3E3F39",
  pmenu_bg = "#99c366",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.one_bg,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = "#a59f85",
  base05 = M.base_30.white,
  base06 = "#f5f4f1",
  base07 = "#f9f8f5",
  base08 = "#fc618d",
  base09 = "#5ad4e6",
  base0A = "#fce566",
  base0B = "#7bd88f",
  base0C = "#5ad4e6",
  base0D = "#5ad4e6",
  base0E = "#948ae3",
  base0F = "#fd9353",
}

M.polish_hl = {
  treesitter = {
    ["parameter"] = { fg = M.base_30.blue },
    ["@variable.member.key"] = { fg = M.base_30.white },
    ["@string"] = { fg = M.base_30.sun },
    ["@boolean"] = { fg = M.base_16.base09 },
    ["@punctuation.bracket"] = { fg = M.base_30.sun },
    ["@operator"] = { fg = M.base_30.red },
  },

  syntax = {
    Operator = { fg = M.base_30.red },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "monekai")

return M
