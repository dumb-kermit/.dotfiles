local M = {
    "arturgoms/moonbow.nvim",
    event = "UiEnter"
}

function M.config()
    vim.cmd "colorscheme moonbow"
end

return M
