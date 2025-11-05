return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "gopls" },
					automatic_enable = false,
				})
			end,
		},
 		{
 			"neovim/nvim-lspconfig",
 			opts = {},
 			config = function()
 				local capabilities = require('cmp_nvim_lsp').default_capabilities()
 				vim.lsp.config.lua_ls = {
 					cmd = { 'lua-language-server' },
 					filetypes = { 'lua' },
 					capabilities = capabilities,
 					root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
 					settings = {
 						Lua = {
 							runtime = {
 								version = 'LuaJIT',
 							},
 							diagnostics = {
 								globals = { 'vim' },
 							},
 							workspace = {
 								library = vim.api.nvim_get_runtime_file("", true),
 							},
 						},
 					},
 				}
 				vim.lsp.config.gopls = {
 					cmd = { 'gopls' },
 					filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
 					capabilities = capabilities,
 					root_markers = { 'go.mod', '.git' },
 				}
 				vim.lsp.enable({ 'lua_ls', 'gopls' })
				vim.diagnostic.config({
					virtual_text = {
						prefix = '■', -- Box-like prefix for inline diagnostics
					},
					signs = true,
					underline = true,
					update_in_insert = false,
				})
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set({"n", "v"}, "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, {})
			end,
		},
}
