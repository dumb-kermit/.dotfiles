-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "fladson/vim-kitty", ft = "kitty" },
        {
            "RRethy/base16-nvim",
            -- lazy = false,
            priority = 1000,
        },
        {
            'echasnovski/mini.animate',
            enabled = false,
            version = false,
            event = "VeryLazy",
            config = function()
                local animate = require('mini.animate')
                require('mini.animate').setup({
                    cursor = {
                        timing = animate.gen_timing.linear({ duration = 60, unit = 'total' }),
                        path = animate.gen_path.line({
                            predicate = function() return true end,
                        }),
                    },
                    open = {
                        -- Animate for 400 milliseconds with linear easing
                        timing = animate.gen_timing.linear({ duration = 400, unit = 'total' }),

                        -- Animate with wiping from nearest edge instead of default static one
                        winconfig = animate.gen_winconfig.wipe({ direction = 'from_edge' }),

                        -- Make bigger windows more transparent
                        winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
                    },

                    close = {
                        -- Animate for 400 milliseconds with linear easing
                        timing = animate.gen_timing.linear({ duration = 400, unit = 'total' }),

                        -- Animate with wiping to nearest edge instead of default static one
                        winconfig = animate.gen_winconfig.wipe({ direction = 'to_edge' }),

                        -- Make bigger windows more transparent
                        winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
                    },
                })
            end
        },
        {
            "sainnhe/gruvbox-material",
            -- lazy = false,
            priority = 1000,
            config = function()
                vim.cmd "let g:gruvbox_material_background='hard'"
                vim.cmd "let g:gruvbox_material_foreground='material'"
                vim.cmd "let g:gruvbox_material_enable_italic=1"
                vim.cmd "let g:gruvbox_material_ui_contrast='high'"
                vim.cmd "let g:gruvbox_material_cursor='auto'"
                vim.cmd "let g:gruvbox_material_diagnostic_virtual_text='colored'"
                vim.cmd "let g:gruvbox_material_current_word='underline'"
                vim.cmd "let g:gruvbox_material_float_style='dim'"
                vim.cmd "let g:gruvbox_material_transparent_background=1"
                vim.cmd "let g:gruvbox_material_disable_terminal_colors=1"
                vim.cmd "let g:gruvbox_material_enable_bold=0"
                vim.cmd "let g:gruvbox_material_show_eob=0"
                vim.cmd "let g:gruvbox_material_statusline_style='original'"
                vim.cmd "let g:gruvbox_material_better_performance=1"
                vim.cmd "let g:gruvbox_material_visual='red background'"
                vim.cmd "let g:gruvbox_material_menu_selection_background='purple'"
                vim.cmd "let g:gruvbox_material_inlay_hints_background='dimmed'"
            end,
        },
        {
            "lmburns/lf.nvim",
            event = "VeryLazy",
            dependencies = { 'akinsho/toggleterm.nvim', version = "*", config = true },
            config = function()
                -- This feature will not work if the plugin is lazy-loaded
                vim.g.lf_netrw = 1

                require("lf").setup({
                    escape_quit = false,
                    border = "shadow",
                    winblend = 0,
                    highlights = { -- highlights passed to toggleterm
                        Normal = { link = "Normal" },
                        NormalFloat = { link = 'Normal' },
                        FloatBorder = { guifg = "#D14D41", guibg = "#100F0F" },
                    },
                })

                vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>")

                -- vim.api.nvim_create_autocmd({
                --     event = "User",
                --     pattern = "LfTermEnter",
                --     callback = function(a)
                --         vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
                --     end,
                -- })
            end,
        },
        {
            "kepano/flexoki-neovim",
            -- enabled = false,
            name = "flexoki",
            -- lazy = false,
            -- priority = 1000,
            -- init = function()
            -- vim.cmd("colorscheme flexoki-light")
            -- vim.cmd("hi EndofBuffer guibg=#FFFCF0 guifg=#FFFCF0")
            -- end,
        },
        {
            "Bekaboo/dropbar.nvim",
            event = "BufEnter",
            dependencies = {
                "nvim-telescope/telescope-fzf-native.nvim",
            },
        },
        {
            "rasulomaroff/reactive.nvim",
            event = "UiEnter",
            config = function()
                require("reactive").setup({
                    builtin = {
                        cursorline = true,
                        cursor = true,
                        modemsg = true,
                    },
                })
            end,
        },
        {
            "j-hui/fidget.nvim",
            event = "VeryLazy",
            opts = {
                notification = {
                    override_vim_notify = true,
                    window = {
                        align = "top",
                        winblend = 0,
                    },
                },
            },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            event = { "BufReadPost", "BufNewFile" },
            cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
            build = ":TSUpdate",
            opts = function()
                return require("config.ts")
            end,
            config = function(_, opts)
                require("config.ts").setup(opts)
            end,
        },
        {
            "williamboman/mason.nvim",
            event = { "FileReadPre", "BufReadPre", "LSPAttach" },
            cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
            opts = function()
                return require("config.msn")
            end,
            config = function(_, opts)
                require("mason").setup(opts)

                -- custom nvchad cmd to install all mason binaries listed
                vim.api.nvim_create_user_command("MasonInstallAll", function()
                    if opts.ensure_installed and #opts.ensure_installed > 0 then
                        for _, tool in ipairs(opts.ensure_installed) do
                            local p = require("mason-registry").get_package(tool)
                            if not p:is_installed() then
                                p:install()
                            end
                        end
                    end
                end, {})

                vim.g.mason_binaries_list = opts.ensure_installed
            end,
        },
        {
            "neovim/nvim-lspconfig",
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            config = function()
                require("config.lsp").defaults()
            end,
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                {
                    "L3MON4D3/LuaSnip",
                    dependencies = "rafamadriz/friendly-snippets",
                    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                    config = function(_, opts)
                        require("luasnip").config.set_config(opts)
                        require("config.snip")
                    end,
                },
                {
                    "saadparwaiz1/cmp_luasnip",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-cmdline",
                },
            },
            opts = function()
                return require("config.cmp")
            end,
            config = function(_, opts)
                require("cmp").setup(opts)
            end,
        },
        {
            "stevearc/conform.nvim",
            event = "BufWritePre",
            keys = {
                {
                    "<leader>x",
                    function()
                        require("conform").format({ async = true, lsp_fallback = true })
                    end,
                    mode = "",
                    desc = " BUFFR FORMAT",
                },
            },
            opts = {
                notify_on_error = false,
                format_on_save = function(bufnr)
                    -- Disable "format_on_save lsp_fallback" for languages that don't
                    -- have a well standardized coding style. You can add additional
                    -- languages here or re-enable it for the disabled ones.
                    local disable_filetypes = { c = true, cpp = true }
                    return {
                        timeout_ms = 500,
                        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                    }
                end,
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform can also run multiple formatters sequentially
                    -- python = { "isort", "black" },
                    --
                    -- You can use a sub-list to tell conform to run *until* a formatter
                    -- is found.
                    -- javascript = { { "prettierd", "prettier" } },
                },
            },
        },
        { -- Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            event = "InsertEnter",
            build = ":TSUpdate",
            opts = {
                ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = {
                    enable = true,
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    --  If you are experiencing weird indenting issues, add the language to
                    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = { "ruby" },
                },
                indent = { enable = true, disable = { "ruby" } },
            },
            config = function(_, opts)
                -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

                -- Prefer git instead of curl in order to improve connectivity in some environments
                require("nvim-treesitter.install").prefer_git = true
                ---@diagnostic disable-next-line: missing-fields
                require("nvim-treesitter.configs").setup(opts)

                -- There are additional nvim-treesitter modules that you can use to interact
                -- with nvim-treesitter. You should go explore a few and see what interests you:
                --
                --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
                --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
                --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope-file-browser.nvim",
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
                },
                "nvim-lua/plenary.nvim",
                "debugloop/telescope-undo.nvim",
                "nvim-telescope/telescope-ui-select.nvim",
            },
            cmd = "Telescope",
            keys = {
                {
                    "<S-b>",
                    "<cmd>Telescope file_browser grouped=true hide_parent_dir=true hidden=true path=%:p:h select_buffer=true<CR>",
                    --"<cmd>Telescope file_browser grouped=true dir_icon=􀈖  path=%:p:h select_buffer=true<CR>",
                    desc = " SCOPE FINDER",
                },
            },
            opts = function()
                return require("config.telescope")
            end,
            config = function(_, opts)
                local telescope = require("telescope")
                telescope.setup(opts)

                -- load extensions
                for _, ext in ipairs(opts.extensions_list) do
                    telescope.load_extension(ext)
                end
            end,
        },
        {
            "echasnovski/mini.statusline",
            version = false,
            event = "VimEnter",
            config = function()
                require("mini.statusline").setup()
            end,
        },
        {
            "folke/which-key.nvim",
            lazy = false,
        },
        {
            "numToStr/Comment.nvim",
            opts = {
                -- add any options here
            },
            lazy = true,
            event = "InsertEnter",
        },
        {
            "code-biscuits/nvim-biscuits",
            lazy = true,
            event = "InsertEnter",
            dependencies = { "nvim-treesitter/nvim-treesitter" },
            run = ":TSUpdate",
            config = function()
                require("nvim-biscuits").setup({
                    cursor_line_only = true,
                    show_on_start = true,
                    --    toggle_keybind = "<leader>B"
                })
            end,
        },
        {
            "ggandor/leap.nvim",
            lazy = true,
            event = "InsertEnter",
            keys = { { "<leader>" } },
            dependencies = { "tpope/vim-repeat" },
            setup = function()
                require("leap").opts.highlight_unlabeled_phase_one_targets = true
            end,
        },
        {
            "ThePrimeagen/harpoon",
            keys = { { "<leader>" } },
            branch = "harpoon2",
            opts = {
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 4,
                },
                settings = {
                    save_on_toggle = true,
                },
            },
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("config.hrpn")
            end,
        },
        {
            "echasnovski/mini.pairs",
            event = "InsertEnter",
            config = function()
                require("mini.pairs").setup()
            end,
        },
        {
            "echasnovski/mini.diff",
            event = "InsertEnter",
            keys = {
                {
                    "<leader>go",
                    function()
                        require("mini.diff").toggle_overlay(0)
                    end,
                    desc = "Toggle mini.diff overlay",
                },
            },
            config = function()
                require("config.diff")
            end,
        },
        {
            "echasnovski/mini.starter",
            -- enabled = false,
            event = "VimEnter",
            config = function()
                require("mini.starter").setup()
                -- opts = function()
                -- local starter = require "mini.starter"
                -- local config = {
                -- content_hooks = {
                -- starter.gen_hook.indexing "section",
                -- },
                -- }
                -- return config
                -- end,
                -- config = function(_, config)
                local starter = require("mini.starter")
                local logo = table.concat({
                    "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
                    "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
                    "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
                    "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
                    "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
                    "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
                }, "\n")
                local nvim = table.concat({
                    "                                                                       ",
                    "                                                                     ",
                    "       ████ ██████           █████      ██                     ",
                    "      ███████████             █████                             ",
                    "      █████████ ███████████████████ ███   ███████████   ",
                    "     █████████  ███    █████████████ █████ ██████████████   ",
                    "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                    "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                    " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                    "                                                                       ",
                }, "\n")
                local pad = string.rep(" ", 22)
                local new_section = function(name, action, section)
                    return { name = name, action = action, section = pad .. section }
                end
                -- starter.setup(config)
                starter.setup({
                    evaluate_single = true,
                    header = nvim,
                    items = {
                        starter.sections.recent_files(3, false, false),
                        starter.sections.telescope(),
                        starter.sections.builtin_actions(),
                    },
                    content_hooks = {
                        starter.gen_hook.adding_bullet(),
                        starter.gen_hook.indexing("all"),
                        -- starter.gen_hook.padding('22', '0'),
                        starter.gen_hook.aligning("center", "center"),
                    },
                })
                vim.api.nvim_create_autocmd("User", {
                    pattern = "LazyVimStarted",
                    callback = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        local pad_footer = string.rep(" ", 8)
                        starter.config.footer = pad_footer
                            .. " NVIM STARTED WITH "
                            .. stats.count
                            .. " PLUGINS IN "
                            .. ms
                            .. "MS"
                        local stat = pad_footer
                            .. " NVIM STARTED WITH "
                            .. stats.count
                            .. " PLUGINS IN "
                            .. ms
                            .. "MS"
                        pcall(starter.refresh)
                    end,
                })
            end,
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    defaults = {
        lazy = true,
    },
    checker = {
        enabled = true,
        concurrency = 1,
        notify = true,        -- get a notification when new updates are found
        frequency = 3600,     -- check for updates every hour
        check_pinned = false, -- check for pinned packages that can't be updated
    },
    change_detection = {
        enabled = true,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "matchparen",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})

require("options")

--require("autocmds")

require("keymaps")

local cmd = vim.cmd
local g = vim.g

local current_theme_name = os.getenv "BASE16_THEME"
if current_theme_name and g.colors_name ~= "base16-" .. current_theme_name then
    cmd "let base16colorspace=256"
    cmd("colorscheme base16-" .. current_theme_name)
end

vim.api.nvim_set_hl(0, "MiniStarterFooter", { link = "TSString", default = true })
vim.api.nvim_set_hl(0, "MiniStarterHeader", { link = "TSString", default = true })
vim.api.nvim_set_hl(0, "MiniStarterSection", { link = "TSFunction", default = true })

vim.opt.fillchars:append { eob = " " }
vim.cmd "hi Comment cterm=italic gui=italic"
vim.cmd "hi String cterm=italic gui=italic"
vim.cmd "hi Operator cterm=italic gui=italic"
vim.cmd "hi Number cterm=italic gui=italic"
