local M = {
	"echasnovski/mini.starter",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = "VimEnter",
}

function M.config()
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
	local logo2 = table.concat({
		"│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│",
		"│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│",
		"│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒┌───────────┘░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│",
		"│▒▒│▓▒▒┌──────┐▓▒▒│░▒│▓▒│░▒▒▒▒▒▒▒▒▒▒▒▒▒│▓▒▒▒▒▒▒┌───┐▓▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒┌──┐▓▒┌──┐▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒└──────────┐░▒▒│▓▒▒▒▒▒▒│░▒▒│▓▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒│▓▒▒▒▒▒▒│░▒▒│▓▒│░▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒┌──────────┘░▒▒│▓▒▒▒▒▒▒│░▒▒│▓▒│░▒│▓▒▒▒▒└──┘▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒│░▒▒▒▒▒▒▒▒▒▒▒▒▒│▓▒▒▒▒▒▒└───┘▓▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒│░▒▒▒▒▒▒▒▒▒▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒└───────────┐░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒└┐▒▒▒▒▒▒▒▒▒▒▒▒┌┘░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒└┐▒▒▒▒▒▒▒▒▒▒┌┘░▒▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│",
		"│▒▒└───┘░▒▒▒▒▒└───┘░▒└──────────────┘░▒└──────────────┘░▒▒▒└──────────┘░▒▒▒▒▒▒└────────┘░▒▒▒▒└──┘░▒└──┘░▒└──┘░▒│",
		"│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│",
		"└──┐▓▒▒┌────┐┌─┐┌┐┌──┐▓▒▒┌───┐▒▒┌─┐▒┌────┐▓▒▒▒▒▒▒▒▒▒┌─────┐▓▒▒▒▒▒▒▒┌────────┐▓▒▒▒▒▒▒▒┌───────┐▓▒▒┌────┐┌┐▓▒▒┌──┘",
		"   │▓▒▒│    ││ ││││  │▓▒▒│   │┌┐│ │▒│    │▓▒▒▒▒▒▒▒▒▒│     │▓▒▒▒▒▒▒▒│        │▓▒▒▒▒▒▒▒│▒▒▒▒   │▒▒▒│    │││▓▒▒│   ",
		"   │▓▒▒│    ││ ││││  │▓▒▒│   ││││ │▒│    │▓▒▒▒▒▒▒▒▒▒│     │▓▒▒▒▒▒▒▒│        │▓▒▒▒▒▒▒▒│▒      │▒▒▒│     │└┐▓▒│   ",
		"   │▓▒▒│    ││ ││└┘  │▓▒▒│   ││││ │▒│    ├────┐▓▒▒▒▒│     │┌────┐▓▒│        │▓▒▒▒▒▒▒▒│▒      │▒▒▒│     │ │▓▒│   ",
		"   │▓▒▒│    ││ ││    └┐▓┌┘   ││└┘ │▒│    │    │▓▒▒▒▒│     ││┌──┐│▓▒│        │▓▒▒▒▒▒▒▒│       │▒┌─┘       │▓┌┘   ",
		"   └─┐▓│    ││ └┘     │▓│    ││   └┐│         └─────┘     └┘│▓▒││▓▒│        │▓▒▒▒▒▒▒▒│       │▒│         │▓│    ",
		"     │▓│    ││        │▓│    ││    ││    │     ▓▒▒▒▒        └──┘│▓▒│        │▓▒▒▒▒▒▒▒│       └┬┘         │▓│    ",
		"     │▓│    ││ ┌┐     │▓│    ││    ││          ▓▒▒          ┌──┐│▓▒│        │▓▒▒▒▒▒▒▒│        │          │▓│    ",
		"     └─┤    ││ ││     │┌┘    └┤    ││          ▓            │▓▒││▓▒│        └┬─┬┬─┬┬┬┘                   └─┘    ",
		"       │    ││ └┘     ││      │    ├┘    │     ▓            ├──┘└─┐│           ││▓│││                           ",
		"     │ │    ││        └┘      │                ▓            │▓▒   ││         │ ││  │          │           ▒     ",
		"            ││                     │           ▓                  ││           │   │                            ",
	}, "\n")
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
		header = logo2,
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
			local stat = pad_footer .. " NVIM STARTED WITH " .. stats.count .. " PLUGINS IN " .. ms .. "MS"
			pcall(starter.refresh)
		end,
	})
end

return M
