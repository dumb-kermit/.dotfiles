local autocmd = vim.api.nvim_create_autocmd
local reactive = ReactiveCursorLine@preset.cursorline.@mode
-- SCOPE Pretty Results Helper --
autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
    end,
})

-- NOCUL for unfocused junk --
-- autocmd({ "WinEnter" }, {
-- callback = function()
-- vim.opt_local.cursorline = true
-- end,
-- })

autocmd({ "BufEnter" }, {
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

autocmd({ "WinLeave" }, {
    callback = function()
        vim.opt_local.cursorline = false
    end,
})

autocmd({ "BufLeave" }, {
    callback = function()
        vim.opt_local.cursorline = false
    end,
})

-- autocmd({ "ReactiveStart" }, {
--     callback = function()
--         vim.cmd("hi reactive.c guibg=#d56527 guifg=#cecdc3")
--         vim.cmd("hi reactive.n guibg=#339f95 guifg=#100F0F")
--         vim.cmd("hi reactive.i guibg=#ca9815 guifg=#100F0F")
--     end,
-- })

-- Leap Junk --
autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("User", {
    pattern = "LeapEnter",
    callback = function()
        vim.cmd.hi("Cursor", "blend=100")
        vim.opt.guicursor:append { "a:Cursor/lCursor" }
    end,
})

autocmd("User", {
    pattern = "LeapLeave",
    callback = function()
        vim.cmd.hi("Cursor", "blend=0")
        vim.opt.guicursor:remove { "a:Cursor/lCursor" }
    end,
})

autocmd("Colorscheme", {
    pattern = "*",
    callback = function()
        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
        end
    end,
})


autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line "'\""
        if
            line > 1
            and line <= vim.fn.line "$"
            and vim.bo.filetype ~= "commit"
            and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
        then
            vim.cmd 'normal! g`"'
        end
    end,
})

autocmd("VimEnter", {
    command = ":silent !wezterm @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
    command = ":silent !wezterm @ set-spacing padding=20 margin=10",
})

-- Block Indentscope on the Dashboard/Starter --
autocmd("FileType", {
    pattern = {
        "mini.starter",
        "alpha",
        "dashboard",
        "neo-tree",
        "telescope",
        "lazy",
        "mason",
        "txt",
        "themery",
        "NvimTree",
        "NvimTree_1",
        "NvimTree_2",
        "NvimTree_3",
        "NvimTree_4",
    },
    callback = function()
        vim.cmd "set nocursorline"
        vim.b.miniindentscope_disable = true
    end,
})


autocmd("InsertEnter", {
    callback = function()
        vim.cmd "set cursorline"
    end
})

-- Resize splits if window got resized --
autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd "tabdo wincmd ="
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Wrap and check for spell in text filetypes --
autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- "Very Lazy" event handler, but, it's made for real people --
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            -- vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
            vim.api.nvim_del_augroup_by_name "NvFilePost"

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})

                if vim.g.editorconfig then
                    require("editorconfig").config(args.buf)
                end
            end, 0)
        end
    end,
})
