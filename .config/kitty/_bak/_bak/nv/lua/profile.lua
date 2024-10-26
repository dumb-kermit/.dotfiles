local M = {}

M.ui = {

    statusline = {
        theme = "minimal",
        separator_style = "round",
    },

    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    },

    lsp = { signature = false },
}

return M
