local M ={
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
}

function M.config()

end
return M
