return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>fa",
			"",
			desc = "+Find and Replace",
		},
		{
			"<leader>far",
			function()
				require("grug-far").open()
			end,
			desc = "Find and Replace",
		},
		{
			"<leader>faw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Find and Replace Word",
		},
		{
			"<leader>fav",
			function()
				require("grug-far").with_visual_selection()
			end,
			desc = "Find and Replace Visual Selection",
		},
	},
}
