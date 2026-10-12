---------------------------------------------------------------
-- Status line
--
-- Inspired by elements of:
-- https://stackoverflow.com/a/5380230
-- https://stackoverflow.com/a/10416234
-- https://github.com/amix/vimrc
---------------------------------------------------------------

local M = {}

-- Filetypes that get a word count in the status line
local prose = { markdown = true, text = true, tex = true, plaintex = true }

-- Shows words selected or words "so far", out of the total
-- Based on: https://vim.fandom.com/wiki/Word_count
function M.words()
    if not prose[vim.bo.filetype] then
        return ""
    end
    local count = vim.fn.wordcount()
    return (" w:%s/%s  "):format(count.visual_words or count.cursor_words, count.words)
end

-- Always show the status line
vim.opt.laststatus=2

-- Colors for status line. Loading a colorscheme clears them, so they are
-- set again after each one
local function set_colors()
    vim.cmd([[
        highlight User1 guifg=#CE933B guibg=#333333
        highlight User2 guifg=#76CE3B guibg=#333333
        highlight User3 guifg=#933BCE guibg=#333333
        highlight User4 guifg=#EA5031 guibg=#333333
        highlight User5 guifg=#F2E863 guibg=#333333
        highlight User6 guifg=#CCCCCC guibg=#333333
        highlight User7 guifg=#FFFFFF guibg=#333333
    ]])
end
set_colors()
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("statusline", {}),
    callback = set_colors,
})

vim.opt.statusline = table.concat({
    -- Buffer number
    "%1* %02n %*",
    -- File name (up to 40 characters)
    "%2*%<%.40t%*",
    -- File type
    "%3* %Y %*",
    -- Flags (modified, readonly, help, etc.)
    "%4*%m%r%w%h%*",
    -- Separator
    "%1*%=",
    -- Column number
    "%5*%c%6*:",
    -- Row number/Number of rows
    "%5*%l%6*/%1*%L",
    -- Percentage of location
    "%7*%6p%%  ",
    -- Word count, only in prose filetypes
    "%{v:lua.require'core.statusline'.words()}",
})

return M
