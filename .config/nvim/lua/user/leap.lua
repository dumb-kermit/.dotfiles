local M = {
	"ggandor/leap.nvim",
	event = "BufReadPost",
}

function M.config()
	-- Define equivalence classes for brackets and quotes, in addition to
	-- the default whitespace group.
	require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }

	-- Use the traversal keys to repeat the previous motion without explicitly
	-- invoking Leap.
	require("leap.user").set_repeat_keys("<enter>", "<backspace>")
	vim.keymap.set("n", "f", "<Plug>(leap)")

	-- The below settings make Leap's highlighting closer to what you've been
	-- used to in Lightspeed.

	vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
	vim.api.nvim_set_hl(0, "LeapMatch", {
		-- For light themes, set to 'black' or similar.
		fg = "white",
		bold = true,
		nocombine = true,
	})
	-- Deprecated option. Try it without this setting first, you might find
	-- you don't even miss it.
	require("leap").opts.highlight_unlabeled_phase_one_targets = true
end
return M
