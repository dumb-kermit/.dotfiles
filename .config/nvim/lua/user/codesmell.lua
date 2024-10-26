local M = {
    "whatsthatsmell/codesmell_dark.vim",
    event = "UiEnter"
}

function M.config()
    vim.cmd "set fillchars+=vert:│"
    vim.cmd "colorscheme codesmell_dark"
end

return M
