local M = {
    "cpea2506/one_monokai.nvim",
    event = "UiEnter"
}

function M.config()
    vim.cmd.colorscheme "one_monokai"
end

return M
