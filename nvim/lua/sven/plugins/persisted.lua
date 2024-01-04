return {
	{
		"olimorris/persisted.nvim",
		config = function()
			local persisted = require("persisted")

			persisted.setup({
				autoload = true,
				require("persisted").setup({
					should_autosave = function()
						-- do not autosave if the alpha dashboard is the current filetype
						if vim.bo.filetype == "alpha" then
							return false
						end
						return true
					end,
				}),
				allowed_dirs = {
    					"~/repos",
 				 },
			})
		end,
	},
}
