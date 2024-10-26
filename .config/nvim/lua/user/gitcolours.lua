local M = { 'projekt0n/github-nvim-theme', event = "UiEnter" }

function M.config()
    vim.cmd('colorscheme github_dark_colorblind')
end

return M
