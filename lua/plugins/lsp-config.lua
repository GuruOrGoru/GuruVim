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
				ensure_installed = { "lua_ls", "gopls", "gofumpt", "goimports", "golangci-lint", "stylua" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			vim.lsp.config('gopls', {
				root_dir = require('lspconfig.util').root_pattern('go.mod', '.git'),
			})
			vim.lsp.config('lua_ls', {
				root_dir = vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':p:h'),
			})
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
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set({"n", "v"}, "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	},
}
