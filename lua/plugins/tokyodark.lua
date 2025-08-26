local default_config = {
    transparent_background = true, -- set background to transparent
    gamma = 1.00, -- adjust the brightness of the theme
    styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },
    custom_highlights = {}, -- extend highlights
    custom_palette = {}, -- extend palette
    terminal_colors = true, -- enable terminal colors
}

return {
    "tiagovla/tokyodark.nvim",
    opts = default_config,
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd([[colorscheme tokyodark]])
    end,
}
