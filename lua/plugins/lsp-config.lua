return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			require("lsp_lines").setup()

			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { only_current_line = true },
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>rm", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, { desc = "Prev diagnostic (jump)" })

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { desc = "Next diagnostic (jump)" })
			end

			lspconfig.lua_ls.setup({ on_attach = on_attach })
			lspconfig.gopls.setup({ on_attach = on_attach })
		end,
	},
}
