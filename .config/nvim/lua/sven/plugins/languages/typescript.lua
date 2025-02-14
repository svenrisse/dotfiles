return {
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup({
				run_as_monorepo = true,
				use_diagnostics = true,
			})
		end,
		keys = {
			{ "<leader>x", "<cmd>TSC<cr>", desc = "Project wide diagnostics (tsc)" },
			{ "<leader>io", "<Cmd>VtsExec organize_imports<CR>", desc = "Organize Import (vts)" },
			{ "<leader>im", "<Cmd>VtsExec add_missing_imports<CR>", desc = "Add missing Imports (vts)" },
			{ "<leader>ir", "<Cmd>VtsExec remove_unused_imports<CR>", desc = "Remove unused Imports (vts)" },
			{ "<leader>is", "<Cmd>VtsExec sort_imports<CR>", desc = "Sort Imports (vts)" },
			{ "<leader>Fa", "<Cmd>VtsExec fix_all<CR>", desc = "Fix all (vts)" },
			{ "<leader>Fr", "<Cmd>VtsExec rename_file<CR>", desc = "Rename File (vts)" },
			{ "<leader>Ff", "<Cmd>VtsExec file_references<CR>", desc = "File References (vts)" },
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = true,
	},
}
