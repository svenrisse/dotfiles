return {
	"olexsmir/gopher.nvim",
	ft = { "go", "gomod" },
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
