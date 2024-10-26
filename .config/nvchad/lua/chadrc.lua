-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "flexoki",
    -- transparency = true,

	hl_override = {
        NvDashAscii = { link = "String" },
        NvDashButtons = { link = "Property" },
        NvDashlazy = { link = "Number" },
        -- Normal = { bg = "#1C1c1c" },
        -- EndOfBuffer = { fg = "#1C1B1A" },

        -- SOLARIZED8
        -- Normal = { bg = "#002D37" },
        -- CursorLine = { bg = "#00464F" },
        -- EndOfBuffer = { bg = "#00333D", fg = "#00333D" },
        -- StatusLine = { bg = "#5B7C84", fg = "#00333D" },
        -- StText = { bg = "#5B7C84", fg = "#00333D" },
        -- St_Pos_bg = { bg = "#5B7C84" },
        -- St_Lsp = { bg = "##5B7C84", fg = "#00333D" },
        -- St_LspMsg = { bg = "#5B7C84", fg = "#00333D" },
        -- MiniIndentscopeSymbol = { fg = "#BD3613" },
        -- CursorLineNr = { bg = "#00464F", fg = "#E33300" },

        -- SOLARIZED8_256
        -- CursorLine = { bg = "#00464F" },
        -- EndOfBuffer = { bg = "#1C1C1C", fg = "#1C1C1C" },
        -- StatusLine = { bg = "#5B7C84", fg = "#1C1C1C" },
        -- StText = { bg = "#5B7C84", fg = "#1C1C1C" },
        -- St_Pos_bg = { bg = "#5B7C84" },
        -- St_Lsp = { bg = "##5B7C84", fg = "#1C1C1C" },
        -- St_LspMsg = { bg = "#5B7C84", fg = "#1C1C1C" },
        -- MiniIndentscopeSymbol = { fg = "#BD3613" },
        -- CursorLineNr = { bg = "#00464F", fg = "#E33300" },


        -- MONOKAI
        -- Normal = { bg = "#222222" },
        -- StText = { bg = "#77715C", fg = "#272821" },
        -- St_Mode = { bg = "#272821", fg = "#77715C"},

        -- FLEXOKI
        -- Normal = { bg = "#1C1B1A" },

        String = { italic = true },
        Boolean = { italic = true, underline = true },
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
    cmp = {
      icons = true,
      lspkind_text = true,
      style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      theme = "vscode", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "round",
 -- order = { "mode", "file", "diagnostics", "git",
      -- "%=", "lsp_msg", "%=", "lsp", "cursor", "cwd" },
    modules = {
      -- Add a custom harpoon module, using the file background.
    },
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = false,
      lazyload = true,
      -- order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },

  lsp = { signature = true },
}

M.nvdash = {
    load_on_startup = true,
}

return M
