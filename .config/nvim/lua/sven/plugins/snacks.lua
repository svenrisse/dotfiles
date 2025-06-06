return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {},
		dashboard = {},
		--explorer = {},
		git = {},
		gitbrowse = {},
		input = {},
		image = {},
		lazygit = {},
		picker = {
			formatters = {
				file = {
					truncate = 80,
				},
			},
			win = {
				-- input window
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } }, -- to close the picker on ESC instead of going to normal mode
						["<c-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					},
				},
			},
			-- sources = {
			-- 	explorer = {
			-- 		layout = { layout = { position = "right" } },
			-- 	},
			-- },
		},
		rename = {},
		scratch = {},
		statuscolumn = {},
		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
		toggle = {},
	},
    -- stylua: ignore start
    keys = {
        { "<leader>.",     function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",     function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>rf",    function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>gB",    function() Snacks.gitbrowse() end, desc = "Git Browse" },
        { "<leader>gb",    function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gl",    function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg",    function() Snacks.lazygit() end, desc = "Lazygit" },
        -- find
  		{ "<leader>f", "", desc = "+find", mode = { "n", "v" } },
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "Find Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>fg", function() Snacks.picker.git_status() end, desc = "Git Status" },
        -- Grep
        { "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>fz", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        -- LSP
        { "<leader>gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "<leader>gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "<leader>gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "<leader>gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    },
	-- stylua: ignore end
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("relativenumber", { name = "relative numbers" }):map("<leader>nr")
			end,
		})

		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
	end,
}
