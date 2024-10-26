local M = {
  "ahmedkhalf/project.nvim",
  -- event = "VeryLazy",
  -- keys = { { "<leader>tp", { desc = "TELESCOPE: PROJECTS" } } }
}

function M.config()
  require("project_nvim").setup {
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = true,
    silent_chdir = true,
    scope_chdir = "global",
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<leader>tp", ":lua require('telescope').extensions.projects.projects()<CR>", { desc = "TELESCOPE: PROJECTS" })
end

return M
