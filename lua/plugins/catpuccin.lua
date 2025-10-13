return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					telescope = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
