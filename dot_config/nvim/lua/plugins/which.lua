return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        -- Disable all functionality except operators and buffers
        require("which-key").register({
            { "<leader>C", hidden = true },
            { "<leader>D", hidden = true },
            { "<leader>S", hidden = true },
            { "<leader>X", hidden = true },
            { "<leader>c", hidden = true },
            { "<leader>d", hidden = true },
            { "<leader>s", hidden = true },
            { "<leader>x", hidden = true },
            { "c", hidden = true },
            { "d", hidden = true },
            { "g", hidden = true },
            { "v", hidden = true },
            { "y", hidden = true },
        })
    end,
    opts = {
        plugins = {
            -- Shows marks on ' and `
            marks = true,
            -- Shows contents of registers
            registers = true,
            -- Shows spelling suggestions with z=
            spelling = {
                enabled = true,
                      suggestions = 10
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = false
            },
        }
    },
}
