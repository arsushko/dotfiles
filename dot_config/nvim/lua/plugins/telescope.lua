return {
    "nvim-telescope/telescope.nvim",
    version = "^0.2",
    dependencies = {
        -- Unmaintained upstream, so pinned to its last commit
        { "nvim-lua/plenary.nvim", commit = "74b06c6" },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
    },
    opts = {
        defaults = {
            -- Lua patterns; each directory is matched at the start of the
            -- path or after a slash, as paths can be relative or absolute
            file_ignore_patterns = {
                "^node_modules/", "/node_modules/",
                "^%.yarn/", "/%.yarn/",
                "^%.git/", "/%.git/",
                "^%.idea/", "/%.idea/",
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
        },
    },
}
