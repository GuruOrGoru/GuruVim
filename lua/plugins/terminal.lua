return {
  "nvim-lua/plenary.nvim",
  config = function()
    vim.keymap.set("n", "<leader>t", function()
      vim.cmd("split | terminal")
    end, { desc = "Open terminal" })
  end
}

