

local M = {
        "NvChad/base46",
        event = "UiEnter",
                build = function()
            require("base46").load_all_highlights()
    end
}

function M.config()
        -- build = function()
            -- require("base46").load_all_highlights()
    -- end
end
return M
