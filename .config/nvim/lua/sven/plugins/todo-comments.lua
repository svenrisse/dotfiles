return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
		highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
	},
	keys = {
		{ "<leader>fT", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
	},
}
