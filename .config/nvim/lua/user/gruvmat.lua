local M = {
	"sainnhe/gruvbox-material",
	event = "UiEnter",
}

function M.config()
	vim.o.background = "dark"
	vim.g.gruvbox_material_ui_contrast = "high"
	vim.g.gruvbox_material_float_style = "bright"
	vim.g.gruvbox_material_inlay_hints_background = "dimmed"
	vim.g.gruvbox_material_current_word = "underline"
	vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	vim.g.gruvbox_material_cursor = "aqua"
	vim.g.gruvbox_material_background = "soft"
	vim.g.gruvbox_material_foreground = "mix"
	vim.g.gruvbox_material_statusline_style = "mix"
	vim.g.gruvbox_material_enable_italic = true
	vim.g.gruvbox_material_lightline_disable_bold = 1
	vim.g.gruvbox_material_show_eob = 0
	vim.g.gruvbox_material_better_performance = 1
	vim.g.gruvbox_material_transparent_background = 2
	vim.cmd.colorscheme("gruvbox-material")
	-- vim.cmd("hi Fg guifg=#b1c1e1")
	-- vim.cmd("hi Comment guifg=#606060")
	-- vim.cmd("hi NormalFloat guibg=#1C2021 guifg=#ebdbb2")
end
return M
