-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup({
	function(use)
		-- packer can manage itself
		use("wbthomason/packer.nvim")
		use("lewis6991/impatient.nvim") -- impatient for startup time
		use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

		-- themes
		use("folke/tokyonight.nvim") -- tokyonight theme
		use("navarasu/onedark.nvim") -- One Dark theme

		use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
		use("ThePrimeagen/vim-be-good")

		-- essential plugins
		use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
		use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

		-- commenting
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({
					pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				})
			end,
		})
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")

		-- noice
		use({
			"folke/noice.nvim",
			config = function()
				require("noice").setup({
					lsp = {
						-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true,
						},
					},
					-- you can enable a preset for easier configuration
					presets = {
						bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
					},
				})
			end,
			requires = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
		})

		-- file explorer
		use("nvim-tree/nvim-tree.lua")

		-- vs-code like icons
		use("kyazdani42/nvim-web-devicons")

		-- colorizer
		use("NvChad/nvim-colorizer.lua")

		-- greeter ui
		use("goolord/alpha-nvim")

		-- status line
		use("nvim-lualine/lualine.nvim")

		-- which-key to suggest keybindings

		--use {
		--  "folke/which-key.nvim",
		--  config = function()
		--    require("which-key").setup {
		--      -- your configuration comes here
		--    }
		--  end
		--}

		-- fuzzy finding w/ telescope
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
		use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

		-- autocompletion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-path")

		-- snippets
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")
		use("saadparwaiz1/cmp_luasnip")

		-- smooth scrolling
		use("karb94/neoscroll.nvim")

		use({
			"ggandor/leap.nvim",
			config = function()
				require("leap").set_default_keymaps()
			end,
		})

		-- managing & installing lsp servers, linters & formatters
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- configuring lsp servers
		use("neovim/nvim-lspconfig") -- easily configure language servers
		use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
		use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
		use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
		use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		-- indent blankline
		use("lukas-reineke/indent-blankline.nvim")

		-- automatic bracket pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- autoclose and rename html tags
		use({
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup({})
			end,
		})

		-- git
		use("tpope/vim-fugitive")
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- diagnostics list
		use("folke/trouble.nvim")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
