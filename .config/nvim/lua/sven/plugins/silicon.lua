return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	init = function()
		local wk = require("which-key")
		wk.register({
			["<leader>sc"] = { ":Silicon<CR>", "Snapshot Code" },
		}, { mode = "v" })
	end,
	config = function()
		require("silicon").setup({
			-- Configuration here, or leave empty to use defaults
			-- the font settings with size and fallback font
			font = "JetBrainsMono Nerd Font=34;Noto Color Emoji",
			-- the theme to use, depends on themes available to silicon
			theme = "OneHalfDark",
			-- the background color outside the rendered os window
			background = "#FFFFFF",
			-- a path to a background image
			background_image = nil,
			-- the paddings to either side
			pad_horiz = 50, --100
			pad_vert = 30, --80
			-- whether to have the os window rendered with rounded corners
			no_round_corner = false,
			-- whether to put the close, minimize, maximise traffic light controls on the border
			no_window_controls = true,
			-- whether to turn off the line numbers
			no_line_number = false,
			-- with which number the line numbering shall start, the default is 1, but here a
			-- function is used to return the actual source code line number
			line_offset = function(args)
				return args.line1
			end,
			-- the distance between lines of code
			line_pad = 0,
			-- the rendering of tab characters as so many space characters
			tab_width = 2,
			-- with which language the syntax highlighting shall be done, should be a function
			-- that returns either a language name or an extension like ".js"
			language = function()
				return vim.bo.filetype
			end,
			-- if the shadow below the os window should have be blurred
			shadow_blur_radius = 16,
			-- the offset of the shadow in x and y directions
			shadow_offset_x = 8,
			shadow_offset_y = 8,
			-- the color of the shadow
			shadow_color = "#100808",
			-- whether to strip of superfluous leading whitespace
			gobble = true,
			-- a string or function that defines the path to the output image
			output = function()
				return "./" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
			end,
			-- whether to put the image onto the clipboard, may produce an error if run on WSL2
			to_clipboard = true,
			-- the silicon command, put an absolute location here, if the command is not in your PATH
			command = "silicon",
			-- a string or function returning a string that defines the title showing in the image
			-- only works in silicon versions greater than v0.5.1
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
		})
	end,
}
