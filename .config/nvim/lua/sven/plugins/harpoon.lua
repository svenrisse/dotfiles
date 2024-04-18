return {
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("harpoon"):setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})
		end,
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "harpoon file",
			},
			{
				"-",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon quick menu",
			},
			{
				"<leader>hn",
				function()
					require("harpoon"):list():next()
				end,
				desc = "harpoon next mark",
			},
			{
				"<leader>hp",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "harpoon prev mark",
			},
			{
				"1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "harpoon to file 1",
			},
			{
				"2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "harpoon to file 2",
			},
			{
				"3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "harpoon to file 3",
			},
			{
				"4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "harpoon to file 4",
			},
			{
				"5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "harpoon to file 5",
			},
		},
	},
}
