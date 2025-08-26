return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it's the last window
      filesystem = {
        follow_current_file = true, -- Focus the file you’re editing
        hijack_netrw_behavior = "open_default", -- Replace netrw
      },
    })

    -- Keymap to toggle Neo-tree
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
  end,
}

