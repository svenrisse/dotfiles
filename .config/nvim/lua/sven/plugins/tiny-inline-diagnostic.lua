return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				show_source = true,
				multilines = {
					enabled = true,
					always_show = true,
				},
				show_all_diags_on_cursorline = true,
				enable_on_insert = false,
				virt_texts = {
					priority = 2048,
				},
			},
		})
	end,
}
