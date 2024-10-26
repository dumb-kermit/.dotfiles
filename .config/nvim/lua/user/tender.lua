local M = {
        "jacoborus/tender.vim",
        event = "UiEnter",
    }

function M.config()
        vim.cmd"let $NVIM_TUI_ENABLE_TRUE_COLOR=1"
        vim.cmd"syntax enable"
        vim.cmd"colorscheme tender"
end

return M
