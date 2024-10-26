local M = {
    "tyrannicaltoucan/vim-quantum",
    event = "UiEnter"
}

function M.config()
    vim.cmd "let g:quantum_italics=1"
    vim.cmd "let g:quantum_black=1"
    vim.cmd "colorscheme quantum"
end

return M
