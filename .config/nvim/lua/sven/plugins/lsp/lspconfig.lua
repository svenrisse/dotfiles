return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local keymap = vim.keymap

		local on_attach = function()
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP Server" })

			--keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })

			keymap.set("n", "<C-X>", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			keymap.set("n", "<C-x>", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
		local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

		lspconfig.ts_ls.setup({
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = volar_path,
						languages = { "vue" },
					},
				},
			},
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"vue",
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.volar.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html" },
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "css", "vue" },
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "css", "vue", "typescriptreact" },
		})

		lspconfig.prismals.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			cmd = { "gopls" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
