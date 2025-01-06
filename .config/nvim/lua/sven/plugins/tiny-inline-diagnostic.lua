return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				-- Show the source of the diagnostic.
				show_source = true,

				-- If multiple diagnostics are under the cursor, display all of them.
				multiple_diag_under_cursor = true,

				-- Enable diagnostic message on all lines.
				multilines = {
					enabled = true,
					always_show = true,
				},

				-- Show all diagnostics on the cursor line.
				show_all_diags_on_cursorline = true,

				-- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
				enable_on_insert = false,

				virt_texts = {
					priority = 2048,
				},
			},
		})
	end,
}
