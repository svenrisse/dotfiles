return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-Left>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-Down>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-Up>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-Right>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
