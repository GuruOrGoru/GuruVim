return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- automatically updates parsers
    opts = {
        ensure_installed = { "lua", "go" }, -- languages to install
        highlight = {
            enable = true,           -- enable Treesitter-based syntax highlighting
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,           -- optional: Treesitter-based indentation
        },
    },
}

