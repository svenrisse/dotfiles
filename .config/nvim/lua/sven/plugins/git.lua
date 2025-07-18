return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 50,
					virt_text_priority = 100,
				},
			})
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		keys = {
			{ "<leader>gc", "", desc = "+git-conflict" },
			{ "<leader>gcq", "<cmd>GitConflictListQf<cr>", desc = "Git Conflicts to quickfix" },
			{ "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose ours / current" },
			{ "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs / incoming" },
			{ "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose both" },
			{ "<leader>gcx", "<cmd>GitConflictChooseNone<cr>", desc = "Choose none" },
			{ "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", desc = "Next Git Conflict" },
			{ "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Git Conflict" },
		},
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>D", "", desc = "Diffview" },
			{
				"<leader>Dc",
				"<cmd>DiffviewClose<cr>",
				desc = "Diffview close",
			},
			{
				"<leader>Dm",
				"<cmd>DiffviewOpen master..HEAD<cr>",
				desc = "Diffview compare current HEAD to master/main",
			},
		},
	},
}
