local M = {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
}

function M.config()
    require('neoscroll').setup({
        easing = 'quintic',
    })
end

return M
