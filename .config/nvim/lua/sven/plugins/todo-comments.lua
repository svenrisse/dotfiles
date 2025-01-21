return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		search = { pattern = [[\b(todo)(\([^\)]*\))?:]] },
		--highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
	},
	keys = {
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},
	},
}
