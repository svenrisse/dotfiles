return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		toggle = { enabled = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle
					.option("relativenumber", { name = "Toggle between relative/absolute numbers" })
					:map("<leader>nr")
			end,
		})
	end,
}
