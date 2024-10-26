local M = {
    "echasnovski/mini.statusline",
    event = "UiEnter",
}

function M.config()
    require "mini.statusline".setup()
end

return M
