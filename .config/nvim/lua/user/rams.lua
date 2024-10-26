local M = {
        'stefanvanburen/rams.vim',
        event = "UiEnter"
    }

function M.config()
        vim.cmd "colorscheme rams"
end
return M
