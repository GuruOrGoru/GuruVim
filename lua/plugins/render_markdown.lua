return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  opts = {
    heading = {
      enabled = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      sign = true,
      width = "block",
      left_pad = 1,
      right_pad = 1,
    },
    code = {
      enabled = true,
      sign = true,
      border = "rounded",
      background = "dark",
      width = "block",
    },
    dash = {
      enabled = true,
      icon = "─",
      width = "full",
    },
    list = {
      enabled = true,
      icon = "•",
      indent = 2,
    },
    checkbox = {
      enabled = true,
      checked = " ",
      unchecked = " ",
      pending = " ",
    },
    quote = {
      enabled = true,
      icon = "▎",
      left_pad = 1,
    },
    link = {
      enabled = true,
      icon = "󰌹 ",
    },
    table = {
      enabled = true,
      border = "rounded",
      alignment = true,
    },
  },
}
