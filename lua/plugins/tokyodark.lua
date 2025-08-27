local default_config = {
    transparent_background = true,
    gamma = 1.00,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        identifiers = { italic = true },
        functions = {},
        variables = {},
    },
    custom_highlights = {},
    custom_palette = {},
    terminal_colors = true,
}

return {
    "tiagovla/tokyodark.nvim",
    opts = default_config,
    config = function(_, opts)
        require("tokyodark").setup(opts)
        vim.cmd([[colorscheme tokyodark]])
    end,
}
