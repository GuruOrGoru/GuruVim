return {
	{
		"mason-org/mason.nvim",
	config = function()
		require("mason").setup()
	end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "gopls"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = function(_, bufnr)
				local opts = { noremap=true, silent=true, buffer=bufnr }

				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<leader>rm', vim.lsp.buf.rename, opts)
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
		end
			lspconfig.lua_ls.setup({
			  on_attach = on_attach,
			})
			lspconfig.gopls.setup({
				on_attach = on_attach,
			})
		end
	},
}
