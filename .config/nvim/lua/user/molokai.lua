local M = {
        "UtkarshVerma/molokai.nvim",
        priority = 1000,
        event = "UiEnter"
    }

function  M.config()
            vim.cmd"colorscheme molokai"
end

return M
