return {
	"Chaitanyabsprip/fastaction.nvim",
	opts = {},
	keys = {
		{
			"<leader>a",
			function()
				require("fastaction").code_action()
			end,
			desc = "code action",
		},
	},
}
