return {
  "sitiom/nvim-numbertoggle",
  event = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave", "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
  config = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
}
