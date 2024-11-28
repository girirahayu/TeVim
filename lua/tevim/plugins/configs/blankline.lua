
local hooks = require("ibl.hooks")

-- Define the rainbow highlight groups
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

-- Register a hook to set highlight groups whenever the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#3b1502" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#574a01" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#06403f" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#472701" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#01360c" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#2a0340" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#013f47" })
end)

-- Main configuration
return {
    indent = {
        char = "│",
        tab_char = "│",
        highlight = highlight, -- Apply the rainbow highlight
    },
    exclude = {
        filetypes = {
            "help",
            "alpha",
            "dashboard",
            "tedash",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
        },
        buftypes = { "terminal", "nofile" },
    },
}
