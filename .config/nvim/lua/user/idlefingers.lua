local M = {
        'shinzui/vim-idleFingers',
        event = 'UiEnter'
    }

function M.config()
        vim.cmd "colorscheme idlefingers"
end
return M
