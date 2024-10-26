local M = {
    'echasnovski/mini.notify', version = false, event = "UiEnter"
}

function M.config()
    require('mini.notify').setup({
        content = {
            format = function(notif) return notif.msg end,
            sort = function(notif_arr)
                table.sort(
                    notif_arr,
                    function(a, b) return a.ts_update > b.ts_update end
                )
                return notif_arr
            end,
        },
        window = {
            -- Floating window config
            config = {
                anchor = "SW"
            },

            -- Maximum window width as share (between 0 and 1) of available columns
            max_width_share = 0.382,

            -- Value of 'winblend' option
            winblend = 25,
        },
    })
    vim.notify = require('mini.notify').make_notify()
end

return M
