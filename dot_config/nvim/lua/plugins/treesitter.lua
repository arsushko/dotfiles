return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- The main branch needs Neovim 0.12 or later. Older versions skip the
    -- plugin and keep regex highlighting
    enabled = vim.fn.has("nvim-0.12") == 1,
    -- Lazy-loading isn't supported
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        local treesitter = require("nvim-treesitter")

        -- Parsers that are always installed; a no-op once they are
        treesitter.install({
            "c",
            "lua",
            "rust",
            "bash"
        })

        local function start(buf, lang)
            -- Without highlight queries this would only turn off regex syntax
            if vim.treesitter.query.get(lang, "highlights") then
                vim.treesitter.start(buf, lang)
            end
        end

        -- Highlights every filetype that has a parser, installing the parser
        -- first if nvim-treesitter has one that isn't installed yet
        local available
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter", {}),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then
                    return
                end
                if vim.treesitter.language.add(lang) then
                    start(args.buf, lang)
                    return
                end
                available = available or treesitter.get_available()
                if not vim.list_contains(available, lang) then
                    return
                end
                treesitter.install(lang):await(vim.schedule_wrap(function(_, ok)
                    if ok and vim.api.nvim_buf_is_valid(args.buf) then
                        start(args.buf, lang)
                    end
                end))
            end,
        })
    end
}
