return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- adapters
		"nvim-neotest/neotest-jest",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "yarn test:local --",
					jestConfigFile = "jest.config.js",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
				require("neotest-golang")({ runner = "gotestsum" }),
			},
			discovery = {
				enabled = false,
			},
		})
	end,
	keys = {
		{ "<leader>t", "", desc = "+test" },
		{
			"<leader>tt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File (Neotest)",
		},
		{
			"<leader>tT",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "Run All Test Files (Neotest)",
		},
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest (Neotest)",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run Last (Neotest)",
		},
		{
			"<leader>ta",
			function()
				require("neotest").run.attach()
			end,
			desc = "Run & Attach (Neotest)",
		},

		{
			"<leader>tu",
			function()
				require("neotest").run.run({ jestCommand = "jest --updateSnapshot " })
			end,
			desc = "Run Nearest & update snapshots",
		},

		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Summary (Neotest)",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Show Output (Neotest)",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle Output Panel (Neotest)",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop (Neotest)",
		},
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end,
			desc = "Toggle Watch (Neotest)",
		},
	},
}
