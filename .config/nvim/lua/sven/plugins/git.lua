vim.g.gitblame_enabled = 1
return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},
	{
		"f-person/git-blame.nvim",
		keys = {
			{ "<leader>gb", ":GitBlameToggle<cr>", desc = "toggle git-blame" },
		},
	},
}
