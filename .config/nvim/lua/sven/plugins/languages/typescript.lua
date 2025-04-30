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
	{
		"Sebastian-Nielsen/better-type-hover",
		config = function()
			require("better-type-hover").setup({
				-- The primary key to hit to open the main window
				openTypeDocKeymap = "K",
				-- Whether to fallback to the old `vim.lsp.buf.hover()` when triggered on anything but an interface or type.
				-- Strongly adviced to keep this on true as it's not stable otherwise.
				fallback_to_old_on_anything_but_interface_and_type = true,
				-- If the declaration in the window is longer than 20 lines remove all lines after the 20th line.
				fold_lines_after_line = 20,
				-- These letters/digits are used in order
				keys_that_open_nested_types = { "a", "s", "b", "i", "e", "u", "r", "x" },
				-- This is to avoid a type hint (i.e. a letter) showing up in the main window
				types_to_not_expand = { "string", "number", "boolean", "Date" },
			})
		end,
	},
}
