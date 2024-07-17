return {
	"echasnovski/mini.files",
	version = "*",
	config = function()
		require("mini.files").setup({
			-- Module mappings created only inside explorer.
			-- Use `''` (empty string) to not create one.
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "<ESC>",
				go_out_plus = "H",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
		})

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>e", ":lua MiniFiles.open()<cr>", { desc = "Toggle MiniFiles" })
	end,
}
