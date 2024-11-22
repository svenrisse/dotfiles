vim.g.gitblame_enabled = 1
return {
	"f-person/git-blame.nvim",
	keys = {
		{ "<leader>gb", ":GitBlameToggle<cr>", desc = "toggle git-blame" },
	},
}
