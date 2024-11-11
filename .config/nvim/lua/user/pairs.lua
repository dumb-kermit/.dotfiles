local M = {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
}

function M.config()
require("nvim-autopairs").setup{
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        }
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
return M
