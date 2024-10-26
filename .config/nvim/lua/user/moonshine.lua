local M = {
	"karoliskoncevicius/moonshine-vim",
	event = "UiEnter",
}

function M.config()
	vim.cmd("colorscheme moonshine_minimal")
end
return M
