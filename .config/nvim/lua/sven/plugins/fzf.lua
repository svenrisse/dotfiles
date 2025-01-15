return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local config = require("fzf-lua.config")
		local actions = require("fzf-lua.actions")

		-- Quickfix
		config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
		config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
		config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
		config.defaults.keymap.fzf["ctrl-x"] = "jump"
		config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
		config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
		config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
		config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

		require("fzf-lua").setup({
			fzf_opts = {
				["--no-scrollbar"] = true,
			},
			winopts = {
				height = 0.95,
				width = 0.95,
				preview = {
					horizontal = "right:40%",
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["ctrl-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["ctrl-h"] = { actions.toggle_hidden },
				},
			},
			oldfiles = {
				include_current_session = true,
			},
			previewers = {
				builtin = {
					syntax_limit_b = 1024 * 100, -- 100KB
				},
			},
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
    -- stylua: ignore
	keys = {
		{ "<leader>f", "", desc = "+fzf" },
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files", },
		{ "<leader>fo", function() require("fzf-lua").resume() end, desc = "Find Resume", },
		{ "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Find oldfiles", },
		{ "<leader>fq", function() require("fzf-lua").quickfix() end, desc = "Find Quickfix-List", },
		{ "<leader>fb", function() require("fzf-lua").builtin() end, desc = "Find Built-In", },
		{ "<leader>fm", function() require("fzf-lua").manpages() end, desc = "Find Man Pages", },
		{ "<leader>fc", function() require("fzf-lua").changes() end, desc = "Find Changes", },

		{ "<leader>fs", function() require("fzf-lua").live_grep_native() end, desc = "Find Grep (live)", },
		{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Find Grep (word)", },
		{ "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Find Grep (WORD)", },
		{ "<leader>fv", function() require("fzf-lua").grep_visual() end, desc = "Find Grep (Visual)", },

		{ "<leader>fg", "", desc = "+fzf git" },
		{ "<leader>fgf", function() require("fzf-lua").git_files() end, desc = "Find Git Files", },
		{ "<leader>fgs", function() require("fzf-lua").git_status() end, desc = "Find Git Status", },
		{ "<leader>fgb", function() require("fzf-lua").git_blame() end, desc = "Find Git Blame", },

		{ "<leader>fl", "", desc = "+fzf lsp" },
		{ "<leader>fls", "", desc = "+fzf lsp symbols" },
		{ "<leader>flsd", function() require("fzf-lua").lsp_document_symbols() end, desc = "Find Document Symbols", },
		{ "<leader>flsw", function() require("fzf-lua").lsp_workspace_symbols() end, desc = "Find Incoming Calls", },
		{ "<leader>fli", function() require("fzf-lua").lsp_incoming_calls() end, desc = "Find Outgoing Calls", },
		{ "<leader>flo", function() require("fzf-lua").lsp_outgoing_calls() end, desc = "Find Code Actions", },
		{ "<leader>fld", function() require("fzf-lua").lsp_document_diagnostics() end, desc = "Find Document Diagnostics", },
		{ "<leader>flw", function() require("fzf-lua").lsp_workspace_diagnostics() end, desc = "Find Workspace Diagnostics", },
	},
}
