return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "claude-3.7-sonnet",
		},
		keys = {
			{
				"<leader>cc",
				"<cmd>CopilotChatToggle<cr>",
				desc = "",
			},
			{
				"<leader>cm",
				"<cmd>CopilotChatModels<cr>",
				desc = "Copilot Models",
			},
			{
				"<leader>cs",
				"<cmd>CopilotChatStop<cr>",
				desc = "Copilot Stop current request",
			},
		},
	},
}
