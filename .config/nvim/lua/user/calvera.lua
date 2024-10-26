local M = {
        'yashguptaz/calvera-dark.nvim',
        event = "UiEnter",
    }

function M.config()
vim.g.calvera_italic_comments = true
vim.g.calvera_italic_keywords = true
vim.g.calvera_italic_functions = true
vim.g.calvera_italic_variables = true
vim.g.calvera_borders = true
vim.g.calvera_contrast = true
vim.g.calvera_hide_eob = true
require('calvera').set()
end
return M
