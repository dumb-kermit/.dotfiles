local M = {
    'yonlu/omni.vim',
    event = "UiEnter"
}

function M.config()
    vim.cmd "colorscheme omni"
end

return M
