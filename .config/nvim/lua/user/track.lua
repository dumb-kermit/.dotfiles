local M = {
    "dharmx/track.nvim",
    config = true,
    keys = { { "<Tab>" } },
    cmd = {
        "Track",
        "Mark",
        "Unmark",
        "RMBranch",
        "NewBranch",
        "SwapBranch",
    },
}

function M.config()
    local set = vim.keymap.set -- tweak to suit your own
    local silent = { silent = true }
    set("n", "<TAB>", "<cmd>Track<cr>", silent)
    set("n", "<leader>kt", "<cmd>Track!<cr>", silent)
    set("n", "<leader>kb", "<cmd>Track branches<cr>", silent)
    set("n", "<leader>km", "<cmd>Mark<cr>", silent)
    set("n", "<leader>ku", "<cmd>Unmark<cr>", silent)

    for serial = 1, 9 do
        local key = tostring(serial)
        set("n", "<leader>" .. key, "<cmd>OpenMark " .. key .. "<cr>")
    end

    -- require("track").setup()
    require("track").setup({ -- non-nerdfonts icons
        pad = { -- built-in UI for viewing marks
            icons = {
                save_done = "", -- not in use
                save = "", -- not in use
                directory = "",
                terminal = "",
                manual = "",
                site = "",
                locked = " ", -- existence cannot be checked (not a path i.e. a command/link/man)
                missing = " ", -- path has been moved/deleted/renamed
                accessible = " ", -- path still exists
                inaccessible = " ", -- N/A / invalid perms
                focused = " ", -- active buffer path (visible)
                listed = "", -- loaded into a listed buffer (invisible)
                unlisted = "≖", -- loaded into an unlisted buffer
            },
        }
        --     pickers = {
        --       branches = {
        --         prompt_prefix = " > ",
        --         selection_caret = " > ",
        --         icons = {
        --           separator = " ",
        --           main = "*",
        --           alternate = "/",
        --           inactive = "#",
        --           mark = "=",
        --           history = "<",
        --         }
        --       },
        --       views = {
        --         selection_caret = " > ",
        --         prompt_prefix = " > ",
        --         icons = {
        --           separator = " ",
        --           terminal = "#",
        --           manual = "^",
        --           missing = "?",
        --           accessible = "*",
        --           inaccessible = "x",
        --           focused = "@",
        --           listed = "S",
        --           unlisted = "$",
        --           file = ".",
        --           directory = "~",
        --         },
        --       },
        --     },
    })
    -- end
end

return M
