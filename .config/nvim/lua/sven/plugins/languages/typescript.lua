return {
	{
		"yioneko/nvim-vtsls",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		enabled = true,
		dependencies = { "nvim-lspconfig" },
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup({
				run_as_monorepo = true,
				use_diagnostics = true,
			})
		end,
		keys = {
			{ "<leader>x", "<cmd>TSC<cr>", desc = "Project wide diagnostics (typescript)" },
		},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup()
		end,
	},
}
