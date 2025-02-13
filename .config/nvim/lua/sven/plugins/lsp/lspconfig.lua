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
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		local on_attach = function()
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP Server" })

			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" })

			keymap.set("n", "<C-X>", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			keymap.set("n", "<C-x>", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
		end
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

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
				"vue",
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.vtsls.setup({
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				--				"vue",
			},
			settings = {
				complete_function_calls = true,
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = {
						completeFunctionCalls = true,
					},
					inlayHints = {
						enumMemberValues = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						variableTypes = { enabled = false },
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.volar.setup({
			init_options = {
				vue = {
					hybridMode = true,
				},
				-- NOTE: This might not be needed. Uncomment if you encounter issues.
				-- typescript = {
				--   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
				-- },
			},
			settings = {
				typescript = {
					inlayHints = {
						enumMemberValues = {
							enabled = true,
						},
						functionLikeReturnTypes = {
							enabled = true,
						},
						propertyDeclarationTypes = {
							enabled = true,
						},
						parameterTypes = {
							enabled = true,
							suppressWhenArgumentMatchesName = true,
						},
						variableTypes = {
							enabled = true,
						},
					},
				},
			},
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "css", "vue" },
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "vue" },
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["gopls"].setup({
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

		lspconfig["lua_ls"].setup({
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
