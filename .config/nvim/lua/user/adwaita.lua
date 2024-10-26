local M = {
    "Mofiqul/adwaita.nvim",
    event = "UiEnter",
}

function M.config()
    vim.g.adwaita_darker = true              -- for darker version
    vim.g.adwaita_disable_cursorline = false -- to disable cursorline
    vim.g.adwaita_transparent = false        -- makes the background transparent
    vim.cmd([[colorscheme adwaita]])
end

return M
