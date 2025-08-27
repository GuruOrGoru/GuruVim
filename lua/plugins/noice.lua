return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    messages = {
      enabled = true,
      view = "mini",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
      kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    },
    routes = {
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        view = "mini",
      },
      {
        filter = { event = "msg_show", kind = "search_count" },
        view = "mini",
      },
    },
    commands = {
      history = {
        view = "popup",
        opts = { size = { width = 0.7, height = 0.5 } },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
  keys = {
    -- scroll in popup
    {
      "<c-d>",
      function() require("noice").scroll(4) end,
      mode = { "i", "n", "s" },
      silent = true,
    },
    {
      "<c-u>",
      function() require("noice").scroll(-4) end,
      mode = { "i", "n", "s" },
      silent = true,
    },
    -- dismiss notifications
    { "<leader>nd", function() require("noice").dismiss() end, desc = "Dismiss Noice messages" },
    -- open command history
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice command history" },
  },
}
