return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  config = function()
    local db = require("dashboard")

   local logo = [[
   ▄██████▄  ███    █▄     ▄████████ ███    █▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   
  ███    ███ ███    ███   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ 
  ███    █▀  ███    ███   ███    ███ ███    ███ ███    ███ ███▌ ███   ███   ███ 
 ▄███        ███    ███  ▄███▄▄▄▄██▀ ███    ███ ███    ███ ███▌ ███   ███   ███ 
▀▀███ ████▄  ███    ███ ▀▀███▀▀▀▀▀   ███    ███ ███    ███ ███▌ ███   ███   ███ 
  ███    ███ ███    ███ ▀███████████ ███    ███ ███    ███ ███  ███   ███   ███ 
  ███    ███ ███    ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ 
  ████████▀  ████████▀    ███    ███ ████████▀   ▀██████▀  █▀    ▀█   ███   █▀  
                          ███    ███                                            
			]]
    db.setup({
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            icon = "󰱼 ",
            icon_hl = "DashboardIcon",
            desc = "Find File",
            desc_hl = "DashboardDesc",
            key = "f",
            key_hl = "DashboardKey",
            action = "Telescope find_files",
          },
          {
            icon = " ",
            desc = "Find Word",
            key = "w",
            key_hl = "DashboardKey",
            action = "Telescope live_grep",
          },
          {
            icon = " ",
            desc = "Recent Files",
            key = "r",
            key_hl = "DashboardKey",
            action = "Telescope oldfiles",
          },
          {
            icon = " ",
            desc = "Edit Config",
            key = "c",
            key_hl = "DashboardKey",
            action = "edit ~/.config/nvim/init.lua",
          },
          {
            icon = " ",
            desc = "Quit GuruNvim",
            key = "q",
            key_hl = "DashboardKey",
            action = "qa",
          },
        },
        footer = {
          "━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          "🌸 GuruOrGoru — powered by Catppuccin",
          "Mocha ☕ Macchiato 🍫 Latte 🥛 Frappé ❄️",
        },
        vertical_center = true,
        top_padding = 2,
        bottom_padding = 2,
      },
    })

 local function gruvbox_dashboard()
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "DashboardIcon",   { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "DashboardDesc",   { fg = "#d79921" })
      vim.api.nvim_set_hl(0, "DashboardKey",    { fg = "#fabd2f" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#928374" })
    end
    gruvbox_dashboard()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = gruvbox_dashboard })
  end,
}
