return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		dim = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		lazygit = { enable = true },
		--notify = { enabled = true },
		--notifier = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		scratch = { enabled = true },
		-- scroll = { enabled = true }, can't be a$$ed to configure steps to replicate smoothness of neoscroll
		terminal = { enabled = true },
		toggle = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
    -- stylua: ignore start
    keys = {
        { "<leader>dime",     function() Snacks.dim() end, desc = "Dim" },
        { "<leader>dimd",     function() Snacks.dim.disable() end, desc = "turn off Dim" },
        { "<leader>.",     function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",     function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>rf",    function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "<leader>gB",    function() Snacks.gitbrowse() end, desc = "Git Browse" },
        { "<leader>gb",    function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gf",    function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg",    function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gl",    function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
        { "<leader>T",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create some toggle mappings
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
