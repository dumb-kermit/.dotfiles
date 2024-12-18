local map = vim.keymap.set

local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
		},
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

-- M.on_attach = function(client, bufnr)
-- 	lsp_keymaps(bufnr)
--
-- 	if client.supports_method("textDocument/inlayHint") then
-- 		vim.lsp.inlay_hint.enable(bufnr, true)
-- 	end
-- end
--
-- function M.common_capabilities()
-- 	local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 	capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 	return capabilities
-- end

M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

	map("n", "<leader>ra", function()
		require("nvchad.lsp.renamer")()
	end, opts("NvRenamer"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "gr", vim.lsp.buf.references, opts("Show references"))
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

function M.config()
	require("lspconfig").lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,
	})
	--  local wk = require "which-key"
	--  wk.register {
	--    ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	--    ["<leader>lf"] = {
	--      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
	--      "Format",
	--    },
	--    ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
	--    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
	--    ["<leader>lh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
	--    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
	--    ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	--    ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
	--    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	--  }

	--  wk.register {
	--    ["<leader>la"] = {
	--      name = "LSP",
	--      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
	--    },
	--  }

	-- local lspconfig = require("lspconfig")
	-- local icons = require("user.icons")
	--
	-- local servers = {
	-- 	"lua_ls",
	-- 	"cssls",
	-- 	"html",
	-- 	-- "tsserver",
	-- 	"eslint",
	-- 	"ts_ls",
	-- 	"pyright",
	-- 	-- "shellcheck",
	-- 	"bashls",
	-- 	"jsonls",
	-- 	"yamlls",
	-- }
	--
	-- local default_diagnostic_config = {
	-- 	signs = {
	-- 		active = true,
	-- 		values = {
	-- 			{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
	-- 			{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
	-- 			{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
	-- 			{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	-- 		},
	-- 	},
	-- 	virtual_text = false,
	-- 	update_in_insert = false,
	-- 	underline = true,
	-- 	severity_sort = true,
	-- 	float = {
	-- 		focusable = true,
	-- 		style = "minimal",
	-- 		border = "double",
	-- 		source = "always",
	-- 		header = "",
	-- 		prefix = "",
	-- 	},
	-- }
	--
	-- vim.diagnostic.config(default_diagnostic_config)
	--
	-- for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
	-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	-- end
	--
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	-- vim.lsp.handlers["textDocument/signatureHelp"] =
	-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	-- -- require("lspconfig.ui.windows").default_options.border = "rounded"
	--
	-- for _, server in pairs(servers) do
	-- 	local opts = {
	-- 		on_attach = M.on_attach,
	-- 		capabilities = M.common_capabilities(),
	-- 	}
	--
	-- 	local require_ok, settings = pcall(require, "user.lspsettings." .. server)
	-- 	if require_ok then
	-- 		opts = vim.tbl_deep_extend("force", settings, opts)
	-- 	end
	--
	-- 	if server == "lua_ls" then
	-- 		require("neodev").setup({})
	-- 	end
	--
	-- 	lspconfig[server].setup(opts)
	-- end
	require("lspconfig").lua_ls.setup({
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						-- Depending on the usage, you might want to add additional paths here.
						-- "${3rd}/luv/library"
						-- "${3rd}/busted/library",
					},
					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
					-- library = vim.api.nvim_get_runtime_file("", true)
				},
			})
		end,
		settings = {
			Lua = {},
		},
	})
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")
	if not configs.config_lsp then
		configs.config_lsp = {
			default_config = {
				cmd = { "config-lsp" },
				filetypes = {
					"sshconfig",
					"sshdconfig",
					"fstab",
					"aliases",
					-- Matches wireguard configs and /etc/hosts
					"conf",
				},
				root_dir = vim.loop.cwd,
			},
		}
	end

	lspconfig.config_lsp.setup({})
	-- local lspconfig = require("lspconfig")
	--
	-- lspconfig.config_lsp.setup({
	-- 	cmd = { "config-lsp" },
	-- 	filetypes = {
	-- 		"sshconfig",
	-- 		"sshdconfig",
	-- 		"fstab",
	-- 		"aliases",
	-- 		-- Matches wireguard configs and /etc/hosts
	-- 		"conf",
	-- 	},
	-- 	root_dir = vim.loop.cwd,
	-- })
end

return M
