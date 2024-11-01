local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local function cond_disable_by_ft()
    local not_empty = conditions.buffer_not_empty()
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

    local filetype_to_ignore = {
        "terminal",
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "dapui_stacks",
        "toggleterm",
        "lazyterm",
        "fzf",
    }

    if vim.tbl_contains(filetype_to_ignore, filetype) then
        return false
    end

    return not_empty
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "catppuccin/nvim",
    },
    event = "VeryLazy",
    priority = 500,
    enabled = true,
    opts = function()
        local icons = require("config.icons")
        local colors = require("theme").get_lualine_colors()

        local kirby_default = "(>*-*)>"
        local mode_kirby = {
            n = "<(•ᴗ•)>",
            i = "<(•o•)>",
            v = "(v•-•)v",
            [""] = "(v•-•)>",
            V = "(>•-•)>",
            c = kirby_default,
            no = "<(•ᴗ•)>",
            s = kirby_default,
            S = kirby_default,
            [""] = kirby_default,
            ic = kirby_default,
            R = kirby_default,
            Rv = kirby_default,
            cv = "<(•ᴗ•)>",
            ce = "<(•ᴗ•)>",
            r = kirby_default,
            rm = kirby_default,
            ["r?"] = kirby_default,
            ["!"] = "<(•ᴗ•)>",
            t = "<(•ᴗ•)>",
        }

        local is_inside_docker = false

        local Job = require("plenary.job")
        Job:new({
            command = os.getenv("HOME") .. "/.config/scripts/is_inside_docker.sh",
            on_stdout = function(_, data)
                if data == "1" then
                    is_inside_docker = true
                end
            end,
        }):start()

        local sections = {
            lualine_a = {
                {
                    "mode",
                    -- icons_enabled = true,
                    fmt = function()
                        return mode_kirby[vim.fn.mode()] or vim.api.nvim_get_mode().mode
                    end,
                    separator = { right = "" },
                    padding = { left = 1, right = 1 },
                },
                {
                    "filename",

                    padding = { right = 1, left = 0 },
                    color = { bg = colors.flamingo, fg = colors.bg },

                    symbols = {
                        modified = icons.signs.file.modified, -- Text to show when the file is modified.
                        readonly = icons.signs.file.readonly, -- Text to show when the file is non-modifiable or readonly.
                        unnamed = icons.signs.file.unnamed,   -- Text to show for unnamed buffers.
                        newfile = icons.signs.file.created,   -- Text to show for newly created file before first write
                    },
                },
            },
            lualine_b = {
                {
                    "progress",
                    separator = { right = "" },
                    color = { fg = colors.fg },
                    padding = { left = 1, right = 0 },
                },
                {
                    "location",
                    separator = { right = "" },
                    color = { fg = colors.fg },
                },
                {
                    function()
                        if vim.fn.mode():find("[vV]") then
                            local ln_beg = vim.fn.line("v")
                            local ln_end = vim.fn.line(".")

                            local lines = ln_beg <= ln_end and ln_end - ln_beg + 1 or ln_beg - ln_end + 1

                            return "sel: " .. tostring(vim.fn.wordcount().visual_chars) .. " | " .. tostring(lines)
                        else
                            return ""
                        end
                    end,
                    color = { fg = colors.fg },
                },
            },
            lualine_c = {
                {
                    "diagnostics",
                    sources = { "nvim_lsp" },
                    symbols = icons.signs.lualine_diagnostic,
                    -- diagnostics_color = {
                    -- 	error = { fg = c.error },
                    -- 	warn = { fg = c.warn },
                    -- 	info = { fg = c.info },
                    -- 	hint = { fg = c.hint },
                    -- },
                    colored = true,
                    padding = { left = 3, right = 1 },
                },
                {
                    function() return require("noice").api.status.message.get() end,
                    cond = function() return package.loaded["noice"] and require("noice").api.status.message.has() end,
                    color = { fg = colors.blue },
                },
            },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    padding = { left = 1, right = 2 },
                    color = { fg = colors.green },
                    separator = { right = "" },
                },
                -- {
                -- 	"copilot",
                -- 	symbols = {
                -- 		status = {
                -- 			hl = {
                -- 				enabled = colors.green,
                -- 				sleep = colors.fg,
                -- 				disabled = colors.red,
                -- 				warning = colors.yellow,
                -- 				unknown = colors.red,
                -- 			},
                -- 		},
                -- 	},
                -- 	show_colors = true,
                -- 	show_loading = false,
                -- 	padding = { left = 1, right = is_inside_docker and 1 or 2 },
                -- 	separator = { right = "" },
                -- },
                {
                    function()
                        local ok, copilot_enabled = pcall(vim.api.nvim_buf_get_var, 0, "copilot_enabled")

                        if ok and copilot_enabled then
                            return icons.signs.others.copilot
                        end

                        return icons.signs.others.copilot_disabled
                    end,
                    -- cond = cond_disable_by_ft,
                    color = { fg = colors.fg },
                    separator = { right = "" },
                    padding = { left = 1, right = 2 },
                },
                {
                    function()
                        if is_inside_docker then
                            return " "
                        end
                        return ""
                    end,
                    separator = { right = "" },
                    color = { fg = colors.blue },
                    padding = { left = 1, right = 2 },
                },
                {
                    function()
                        return " "
                    end,
                    separator = { right = "" },
                    padding = { left = 0, right = 0 },
                },
            },
            lualine_y = {
                -- {
                -- 	-- Lsp server name .
                -- 	function()
                -- 		local msg = "No Active Lsp"
                -- 		local text_clients = ""
                --
                -- 		local clients = vim.lsp.get_clients({ bufnr = 0 })
                -- 		if next(clients) == nil then
                -- 			return msg
                -- 		end
                -- 		for _, client in ipairs(clients) do
                -- 			if client.name ~= "copilot" then
                -- 				text_clients = text_clients .. client.name .. ", "
                -- 			end
                -- 		end
                -- 		if text_clients ~= "" then
                -- 			return text_clients:sub(1, -3)
                -- 		end
                -- 		return msg
                -- 	end,
                -- 	icon = "󰅡",
                -- 	color = { fg = colors.text },
                -- },
                {
                    "branch",
                    icon = icons.signs.git.branch,
                    color = { fg = colors.violet },
                    separator = { right = "", left = "" },
                },
                {
                    "diff",
                    colored = true,
                    source = diff_source,
                    symbols = {
                        added = icons.signs.git.added,
                        modified = icons.signs.git.modified,
                        removed = icons.signs.git.removed,
                    },
                    -- diff_color = {
                    -- 	added = { gui = "bold" },
                    -- 	modified = { gui = "bold" },
                    -- 	removed = { gui = "bold" },
                    -- },
                },
            },
            lualine_z = {
                {
                    "filetype",
                    color = { bg = colors.flamingo, fg = colors.bg },
                    -- cond = cond_disable_by_ft,
                    icon_only = true,
                    colored = false,
                    padding = { right = 0, left = 1 },
                    condition = conditions.buffer_not_empty,
                },
            },
        }

        local config = {
            options = {
                theme = "auto",
                icons_enabled = true,
                disabled_filetypes = { "alpha" },
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                -- section_separators = "",
            },
            sections = sections,
            inactive_sections = sections,
            disabled_filetypes = { "alpha" },
        }

        -- ins_left()

        return config
    end,
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
