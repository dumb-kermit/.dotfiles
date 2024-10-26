local M = {
        'junegunn/seoul256.vim',
        event = 'UiEnter'
    }

function M.config()
        vim.cmd "set background=dark"
        vim.cmd "let g:seoul256_background=233"
        vim.cmd "let g:seoul256_srgb = 1"
        vim.cmd "colorscheme seoul256"
end
return M
