return {
	"ptdewey/yankbank-nvim",
	init = function()
		local wk = require("which-key")
		wk.register({
			["<leader>y"] = { ":YankBank<CR>", "YankBank" },
		})
	end,
	config = function()
		require("yankbank").setup()
	end,
}
