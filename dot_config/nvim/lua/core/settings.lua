----------------------------------------------------------------
-- Vim settings
----------------------------------------------------------------

-- Workaround for vim to reset cursor when leaving
vim.cmd([[
    augroup resetcursor
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1-blinkon0
    augroup end
]])

-- Enables 24-bit colors
vim.opt.termguicolors = true

-- Folding
vim.opt.foldmethod = "indent"

-- Disables folding by default
vim.opt.foldenable = false

-- Enables persistent undo
vim.opt.undofile = true

-- Disables swapfiles
vim.opt.swapfile = false

-- Number of lines that remain visible cursor when scrolling
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 7

-- Disables showing mode on the bottom. Should be obvious from cursor
--vim.opt.showmode = false

-- Disables wrapping
vim.opt.wrap = false

-- Visible whitespace
-- See :help lua line 1139
vim.opt.list = true
vim.opt.listchars = {
    trail      = "-",
    tab        = "▸ ",
    extends    = "❱",
    precedes   = "❰",
    multispace = "·",
    lead       = " "
}

-- Don't insert completion option until it is selected
vim.opt.completeopt = {
    "noinsert",
    "menuone",
    "noselect"
}

-- Case sensitive search only when at least one capital is
-- present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enables relative numbers
vim.opt.relativenumber = true
-- Enables highlighting of current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Tweaks for working with manpages, help, and plaintext
vim.cmd([[
    augroup plaintext
        autocmd!

        " Applies to markdown, plaintext, LaTeX, and plain TeX
        autocmd FileType markdown,text,tex,plaintex
        \ setlocal norelativenumber  " Disables relative numbers
        autocmd FileType markdown,text,tex,plaintex
        \ setlocal wrap              " Enables line wrapping
        autocmd FileType markdown,text,tex,plaintex
        \ setlocal linebreak         " Makes lines break at spaces

        " Applies to man and help pages
        autocmd FileType man,help
        \ setlocal scrolloff=99999    " Always centers screen
        " Rebinds q to quit
        autocmd FileType man,help
        \ nnoremap <buffer> q :q!<CR>
    augroup end
]])

-- Remember position after exiting file, except in commit and rebase messages.
-- The filetype isn't detected yet on BufReadPost, so the check waits until
-- the buffer is shown in a window. See :help last-position-jump
vim.g.leave_my_cursor_position_alone = 1 -- Disables Gentoo's sysinit.vim version
vim.api.nvim_create_autocmd("BufReadPost", {
    group = vim.api.nvim_create_augroup("fileposition", {}),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWinEnter", {
            buffer = args.buf,
            once = true,
            callback = function()
                local ft = vim.bo[args.buf].filetype
                if ft:find("commit") or ft == "gitrebase" or ft == "xxd" then
                    return
                end
                local line = vim.api.nvim_buf_get_mark(args.buf, '"')[1]
                if line > 1 and line <= vim.api.nvim_buf_line_count(args.buf) then
                    vim.cmd('normal! g`"')
                end
            end,
        })
    end,
})

-- Auto yank to clipboard
vim.opt.clipboard="unnamedplus"

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.opt.matchtime = 2

-- Don't redraw while executing macros; improves performance
vim.opt.lazyredraw = true

-- Ignore useless files with :e
-- Check :help lua.txt line 1114
vim.opt.wildignore = {
    -- Version control
    "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store",
    -- Compiled files
    "*.o", "*.elf", "*.pyc", "*.bin", "*.exe", "*.msi",
    -- Images
    "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.ico",
    -- Binary documents
    "*.pdf", "*.doc*", "*.xls*", "*.ppt*", "*.odt", "*.djvu", "*.fb2",
    -- Archives
    "*.zip", "*.tar", "*.rar", "*.7z", "*.gz", "*.bz2",
    -- Audio
    "*.mp3", "*.opus", "*.wav", "*.flac", "*.m4a", "*.m4b",
    -- Video
    "*.mp4", "*.mkv", "*.webm", "*.avi",
    -- Miscellaneous
    "*.dat", "*.db", "*.iso", "*.img", "*.torrent"
}

-- Set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Auto convert tabs to spaces
vim.opt.expandtab = true

-- Disables netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
