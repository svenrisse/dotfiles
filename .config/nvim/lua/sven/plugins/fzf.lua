return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.95,
				width = 0.95,
			},
		})
	end,
    -- stylua: ignore
	keys = {
		{ "<leader>f", "", desc = "+fzf" },
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files", },
		{ "<leader>fr", function() require("fzf-lua").resume() end, desc = "Find Resume", },
		{ "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "Find Resume", },
		{ "<leader>fq", function() require("fzf-lua").quickfix() end, desc = "Find Quickfix-List", },
		{ "<leader>fb", function() require("fzf-lua").builtin() end, desc = "Find Built-In", },
		{ "<leader>fm", function() require("fzf-lua").manpages() end, desc = "Find Man Pages", },
		{ "<leader>fc", function() require("fzf-lua").changes() end, desc = "Find Changes", },
		{ "<leader>fc", function() require("fzf-lua").changes() end, desc = "Find Changes", },

		{ "<leader>fs", "", desc = "+fzf grep" },
		{ "<leader>fss", function() require("fzf-lua").live_grep_native() end, desc = "Find Grep (live)", },
		{ "<leader>fsl", function() require("fzf-lua").live_grep_resume() end, desc = "Find Grep (last)", },
		{ "<leader>fsw", function() require("fzf-lua").grep_cword() end, desc = "Find Grep (word)", },
		{ "<leader>fsW", function() require("fzf-lua").grep_cWORD() end, desc = "Find Grep (WORD)", },

		{ "<leader>fg", "", desc = "+fzf git" },
		{ "<leader>fgf", function() require("fzf-lua").git_files() end, desc = "Find Git Files", },
		{ "<leader>fgs", function() require("fzf-lua").git_status() end, desc = "Find Git Status", },
		{ "<leader>fgb", function() require("fzf-lua").git_blame() end, desc = "Find Git Blame", },

		{ "<leader>fl", "", desc = "+fzf lsp" },
		{ "<leader>flr", function() require("fzf-lua").lsp_references() end, desc = "Find References", },
		{ "<leader>fld", function() require("fzf-lua").lsp_definitions() end, desc = "Find Definitions", },
		{ "<leader>flD", function() require("fzf-lua").lsp_declarations() end, desc = "Find Declarations", },
		{ "<leader>flt", function() require("fzf-lua").lsp_typedefs() end, desc = "Find Type Definition", },
		{ "<leader>fli", function() require("fzf-lua").lsp_implementations() end, desc = "Find Implementations", },
		{ "<leader>fls", "", desc = "+fzf lsp symbols" },
		{ "<leader>flsd", function() require("fzf-lua").lsp_document_symbols() end, desc = "Find Document Symbols", },
		{ "<leader>flsw", function() require("fzf-lua").lsp_workspace_symbols() end, desc = "Find Incoming Calls", },
		{ "<leader>flc", "", desc = "+fzf lsp calls" },
		{ "<leader>flci", function() require("fzf-lua").lsp_incoming_calls() end, desc = "Find Outgoing Calls", },
		{ "<leader>flco", function() require("fzf-lua").lsp_outgoing_calls() end, desc = "Find Code Actions", },
		{ "<leader>flx", "", desc = "+fzf lsp diagnostics" },
		{ "<leader>flxd", function() require("fzf-lua").lsp_document_diagnostics() end, desc = "Find Document Diagnostics", },
		{ "<leader>flxw", function() require("fzf-lua").lsp_workspace_diagnostics() end, desc = "Find Workspace Diagnostics", },
	},
}
