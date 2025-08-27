return {
	"romgrk/barbar.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-Right>", ":BufferNext<CR>", opts)
		vim.keymap.set("n", "<C-Left>", ":BufferPrevious<CR>", opts)
		vim.keymap.set("n", "<leader>c", ":BufferClose<CR>", opts)
	end,
}
