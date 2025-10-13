return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.golangci_lint,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports,

        nls.builtins.formatting.stylua,
      })
      return opts
    end,
  },
}
