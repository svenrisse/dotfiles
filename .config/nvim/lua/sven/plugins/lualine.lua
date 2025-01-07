return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local harpoon_files = require("harpoon_files")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
					"%=",
					-- {
					-- 	"harpoon2",
					-- 	indicators = { "1", "2", "3", "4", "5", "6" },
					-- 	active_indicators = { "-1-", "-2-", "-3-", "-4-", "-5-", "-6-" },
					-- },
					{ harpoon_files.lualine_component },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "diff" },
				lualine_z = { "searchcount" },
			},
		})
	end,
}
