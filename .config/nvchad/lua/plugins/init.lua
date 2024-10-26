return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    -- { "folke/which-key.nvim",
        -- event = "VeryLazy",
        -- keys = {{"<space>"}},
        -- config = true,
    -- },
["folke/which-key.nvim"] = {
disable = true,
},
        {
        'echasnovski/mini.clue',
        -- enabled = false,
        version = false,
        keys = { { '<leader>' } },
        config = function()
            local miniclue = require 'mini.clue'
            miniclue.setup {
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = '<Leader>' },
                    { mode = 'x', keys = '<Leader>' },

                    -- Built-in completion
                    { mode = 'i', keys = '<C-x>' },

                    -- `g` key
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },

                    -- Marks
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'x', keys = "'" },
                    { mode = 'x', keys = '`' },

                    -- Registers
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- `z` key
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
            }
        end,
    },
    { 'HiPhish/rainbow-delimiters.nvim',
        enabled = false,
        event = 'BufReadPost',
    },
    {
        'abeldekat/harpoonline',
        enabled = false,
        event = 'UiEnter',
        config = true,
        opts = {
            formatter_opts = {
                default = {
                    inactive = '%s', -- including spaces
                    active = '[%s]',
                }
            },
        },
    },
    {
        'code-biscuits/nvim-biscuits',
        enabled = false,
        event = "BufReadPost",
        opts = {
            default_config = {
                min_distance = 1
            }
        }
    },
      {
    'loganswartz/sunburn.nvim',
    enabled = false,
    dependencies = { 'loganswartz/polychrome.nvim' },
    event = 'UiEnter',
    config = function()
      -- vim.g.sunburn_palette_size = 8
      vim.g.sunburn_bright_variant = true
      vim.cmd.colorscheme 'sunburn'
      vim.cmd 'hi EndofBuffer guifg=#181818'
      vim.cmd 'hi CursorLineNr guibg=#181818 guifg=#9880D0'
      vim.cmd 'hi TelescopeBorder guifg=#181818 guibg=#181818'
      vim.cmd 'hi WhichKeyBorder guibg=#181818 guifg=#9880D0'
      vim.cmd 'hi Comment cterm=italic gui=italic'
      -- vim.cmd "hi Type cterm=underline gui=underline"
      vim.cmd 'hi String cterm=italic gui=italic'
      vim.cmd 'hi StatusLine guibg=#181818 guifg=#2587BE'
      -- vim.cmd("hi Comment guifg=#2C3539")
      vim.cmd 'hi @variable guifg=#b1c1e1'
      vim.cmd 'hi @variable.member guifg=#b1c1e1'
      -- vim.cmd 'hi Normal guibg=none'
    end,
  },
    {
        "mvllow/modes.nvim",
        enabled = false,
        event = "BufReadPost",
        config = function()
            require("modes").setup({
                colors = {
                    -- bg = "#5B7C84",
                    -- bg = "",
                    -- copy = "#C08000",
                    -- delete = "#c75c6a",
                    -- insert = "#BD3613",
                    -- visual = "#7D9A00",
                    copy = "#E77E9C",
                    delete = "#FF0428",
                    insert = "#B9BB00",
                    visual = "#FFB700",
                },
                line_opacity = 0.20,

                -- Set opacity for cursorline and number background

                set_cursorline = true,

                -- Enable line number highlights to match cursorline
                set_number = false,

                -- Disable modes highlights in specified filetypes
                -- Please PR commonly ignored filetypes
                ignore_filetypes = { "NvimTree", "TelescopePrompt" },
            })
        end
    },
    {
        'Bekaboo/dropbar.nvim',
        event = 'BufReadPre',
        config = function()
            -- Modified version of https://github.com/Bekaboo/dropbar.nvim/issues/2#issuecomment-1568244312, thanks!
            local function bar_background_color_source()
                local function set_highlight_take_foreground(opts, source_hl, target_hl)
                    if target_hl == nil then
                        target_hl = source_hl
                    end
                    local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(source_hl)), 'fg#')
                    if fg == '' then
                        vim.api.nvim_set_hl(0, target_hl, opts)
                    else
                        vim.api.nvim_set_hl(0, target_hl, vim.tbl_extend('force', opts, { fg = fg }))
                    end
                end

                local function color_symbols(symbols, opts)
                    for _, symbol in ipairs(symbols) do
                        local source_hl = symbol.icon_hl
                        symbol.icon_hl = 'DropbarSymbol' .. symbol.icon_hl
                        symbol.name_hl = symbol.icon_hl
                        set_highlight_take_foreground(opts, source_hl, symbol.icon_hl)
                    end
                    return symbols
                end

                return {
                    get_symbols = function(buf, win, cursor)
                        -- Use the background of the WinBar highlight group
                        local opts = { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID 'WinBar'), 'bg#') }
                        set_highlight_take_foreground(opts, 'DropBarIconUISeparator')
                        set_highlight_take_foreground(opts, 'DropBarIconUIPickPivot')

                        local sources = require 'dropbar.sources'
                        if vim.bo[buf].ft == 'markdown' then
                            return color_symbols(sources.markdown.get_symbols(buf, win, cursor), opts)
                        end
                        if vim.bo[buf].ft == 'terminal' then
                            return color_symbols(sources.terminal.get_symbols(buf, win, cursor), opts)
                        end

                        for _, source in ipairs { sources.lsp, sources.treesitter } do
                            local symbols = source.get_symbols(buf, win, cursor)
                            if not vim.tbl_isempty(symbols) then
                                return color_symbols(symbols, opts)
                            end
                        end
                        return {}
                    end,
                }
            end

            require('dropbar').setup {
                bar = {
                    sources = function(_, _)
                        return { bar_background_color_source() }
                    end,
                },
            }
        end,
    },
    { 'shaunsingh/solarized.nvim',
        enabled = false,
        event = 'UiEnter',
        config = function()
            vim.cmd "colorscheme solarized"
        end
    },
    {"j-hui/fidget.nvim",
	event = "VeryLazy",
    config = function()
            require("fidget").setup({
		-- Options related to LSP progress subsystem
		progress = {
			poll_rate = 0, -- How and when to poll for progress messages
			suppress_on_insert = false, -- Suppress new messages while in insert mode
			ignore_done_already = false, -- Ignore new tasks that are already complete
			ignore_empty_message = false, -- Ignore new tasks that don't contain a message
			-- Clear notification group when LSP server detaches
			clear_on_detach = function(client_id)
				local client = vim.lsp.get_client_by_id(client_id)
				return client and client.name or nil
			end,
			-- How to get a progress message's notification group key
			notification_group = function(msg)
				return msg.lsp_client.name
			end,
			ignore = {}, -- List of LSP servers to ignore

			-- Options related to how LSP progress messages are displayed as notifications
			display = {
				render_limit = 16, -- How many LSP messages to show at once
				done_ttl = 3, -- How long a message should persist after completion
				done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
				done_style = "Constant", -- Highlight group for completed LSP tasks
				progress_ttl = math.huge, -- How long a message should persist when in progress
				-- Icon shown when LSP progress tasks are in progress
				progress_icon = { pattern = "dots", period = 1 },
				-- Highlight group for in-progress LSP tasks
				progress_style = "WarningMsg",
				group_style = "Title", -- Highlight group for group name (LSP server name)
				icon_style = "Question", -- Highlight group for group icons
				priority = 30, -- Ordering priority for LSP notification group
				skip_history = true, -- Whether progress notifications should be omitted from history
				-- How to format a progress message
				format_message = require("fidget.progress.display").default_format_message,
				-- How to format a progress annotation
				format_annote = function(msg)
					return msg.title
				end,
				-- How to format a progress notification group's name
				format_group_name = function(group)
					return tostring(group)
				end,
				overrides = { -- Override options from the default notification config
					rust_analyzer = { name = "rust-analyzer" },
				},
			},

			-- Options related to Neovim's built-in LSP client
			lsp = {
				progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
				log_handler = false, -- Log `$/progress` handler invocations (for debugging)
			},
		},

		-- Options related to notification subsystem
		notification = {
			poll_rate = 10, -- How frequently to update and render notifications
			filter = vim.log.levels.INFO, -- Minimum notifications level
			history_size = 128, -- Number of removed messages to retain in history
			override_vim_notify = true, -- Automatically override vim.notify() with Fidget
			-- How to configure notification groups when instantiated
			configs = { default = require("fidget.notification").default_config },
			-- Conditionally redirect notifications to another backend
			redirect = function(msg, level, opts)
				if opts and opts.on_open then
					return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
				end
			end,

			-- Options related to how notifications are rendered as text
			view = {
				stack_upwards = false, -- Display notification items from bottom to top
				icon_separator = " ", -- Separator between group name and icon
				group_separator = "---", -- Separator between notification groups
				-- Highlight group used for group separator
				group_separator_hl = "Comment",
				-- How to render notification messages
				render_message = function(msg, cnt)
					return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
				end,
			},

			-- Options related to the notification window and buffer
			window = {
				normal_hl = "Comment", -- Base highlight group in the notification window
				winblend = 100, -- Background color opacity in the notification window
				border = "none", -- Border around the notification window
				zindex = 45, -- Stacking priority of the notification window
				max_width = 0, -- Maximum width of the notification window
				max_height = 0, -- Maximum height of the notification window
				x_padding = 4, -- Padding from right edge of window boundary
				y_padding = 0, -- Padding from bottom edge of window boundary
				align = "top", -- How to align the notification window
				relative = "editor", -- What the notification window position is relative to
			},
		},

		-- Options related to integrating with other plugins
		integration = {
			["nvim-tree"] = {
				enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
			},
			["xcodebuild-nvim"] = {
				enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
			},
		},

		-- Options related to logging
		logger = {
			level = vim.log.levels.WARN, -- Minimum logging level
			max_size = 10000, -- Maximum log file size, in KB
			float_precision = 0.01, -- Limit the number of decimals displayed for floats
			-- Where Fidget writes its logs to
			path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
		},
	})
end
    },
--        { "folke/which-key.nvim", enabled = false, },
  {
    'echasnovski/mini.clue',
    enabled = false,
    lazy = false,
    version = false,
    keys = { { '<leader>' } },
    config = function()
      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }
    end,
  },
    {
        'ThePrimeagen/harpoon',
        -- event = 'VeryLazy',
        branch = 'harpoon2',
        opts = {
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
            settings = {
                save_on_toggle = true,
            },
        },
        keys = function()
            local keys = {
                {
                    '<leader>',
                    function()
                        require('harpoon'):list():add()
                    end,
                    desc = 'Harpoon File',
                },
                {
                    '<S-Enter>',
                    function()
                        local harpoon = require 'harpoon'
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = 'Harpoon Quick Menu',
                },
            }

            for i = 1, 5 do
                table.insert(keys, {
                    '<leader>' .. i,
                    function()
                        require('harpoon'):list():select(i)
                    end,
                    desc = 'Harpoon to File ' .. i,
                })
            end
            return keys
        end,
    },
    {
        'fladson/vim-kitty',
        ft = 'kitty',
    },
    {
        'echasnovski/mini.indentscope',
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = 'BufReadPost',
        config = function()
            local animate = require('mini.indentscope')
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    animation = animate.gen_animation.linear({ duration = 800, unit = 'total' }),
                },
                -- symbol = "▏",
                -- symbol = '│',
                symbol = '',
                options = { try_as_border = true },
            })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'alpha',
                    'dashboard',
                    'fzf',
                    'help',
                    'lazy',
                    'lazyterm',
                    'mason',
                    'neo-tree',
                    'notify',
                    'toggleterm',
                    'Trouble',
                    'trouble',
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
    {
        "edluffy/specs.nvim",
        enabled = false,
        event = "BufReadPost",
        config = function()
            require("specs").setup({
                show_jumps = true,
                min_jump = 2,
                popup = {
                    delay_ms = 4, -- delay before popup displays
                    inc_ms = 10, -- time increments used for fade/resize effects
                    blend = 80, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 20,
                    winhl = "IncSearch",
                    fader = require("specs").sinus_fader,
                    resizer = require("specs").shrinesizer,
                },
                ignore_filetypes = { "TelescopePrompt" },
                ignore_buftypes = {
                    nofile = true,
                },
            })
        end
    },
    -- {
    -- 'lewis6991/gitsigns.nvim',
    -- enabled = false,
    -- },
    {
        'echasnovski/mini.diff',
        -- enabled = false,
        version = false,
        event = 'BufReadPre',
        config = function()
            local diff = require 'mini.diff'
            require('mini.diff').setup {
                -- Options for how hunks are visualized
                -- view = {
                -- Visualization style. Possible values are 'sign' and 'number'.
                -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
                --style = 'sign',

                -- Signs used for hunks with 'sign' view
                view = {
                    style = 'sign',
                    -- signs = { add = '▒▒', change = '▒▒', delete = '▒▒' },
                    signs = {
                    -- add = "􀁍 ",
                    -- change = "􀘝 ",
                    -- delete = "􀁏 ",
                    -- 	add = " ",
                    -- 	change = " ",
                    -- 	delete = " ",
                    -- },
				add = " ",
				change = " ✱",
				delete = " ",
                    -- add = "􀆞 ",
                    -- change = "􀆡 ",
                    -- delete = "􀆗 ",
                    -- },
                    -- add = '􁂇 ',
                    -- change = '􁂆 ',
                    -- delete = '􀅌 ',
                    },
                    -- Priority of used visualization extmarks
                    priority = 999, -- don't see any signs
                },
                -- edit this place
                -- Source for how reference text is computed/updated/etc
                -- Uses content from Git index by default
                source = diff.gen_source.save(),
                --yeah this moment

                -- Delays (in ms) defining asynchronous processes
                delay = {
                    -- How much to wait before update following every text change
                    text_change = 5,
                },
                -- Module mappings. Use `''`-- (empty string) to disable one.
                mappings = {
                    -- Apply hunks inside a visual/operator region
                    apply = 'gh',

                    -- Reset hunks inside a visual/operator region
                    reset = 'gH',

                    -- Hunk range textobject to be used inside operator
                    textobject = 'gh',

                    -- Go to hunk range in corresponding direction
                    goto_first = '[H',
                    goto_prev = '[h',
                    goto_next = ']h',
                    goto_last = ']H',
                },
                options = {
                    -- Diff algorithm. See `:h vim.diff()`.
                    algorithm = 'histogram',

                    -- Whether to use "indent heuristic". See `:h vim.diff()`.
                    indent_heuristic = true,

                    -- The amount of second-stage diff to align lines (in Neovim>=0.9)
                    linematch = 60, --ugh pls

                    -- Whether to wrap around edges during hunk navigation
                    wrap_goto = false,
                },
            }
            vim.cmd 'hi MiniDiffSignAdd guifg=#D39501'
            vim.cmd 'hi MiniDiffSignChange guifg=#78834B'
        end,
    },
    { 'lukas-reineke/indent-blankline.nvim', enabled = false },
    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
