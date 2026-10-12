-- Non-recursive by default; an empty command maps to <Nop>
local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, { silent = true })
end

-- Normal, visual and operator-pending modes. Unlike "", this leaves out
-- Select mode, where typed keys should replace the selection
local nxo = { "n", "x", "o" }

---------------------------------------------------------------
-- Leader key
---------------------------------------------------------------

-- With a map leader it's possible to do extra key combinations
vim.g.mapleader = " "
vim.g.maplocalleader = ","

---------------------------------------------------------------
-- Custom mappings
---------------------------------------------------------------

-- Leader-action to delete without copying
map(nxo, "<leader>x", "\"_x")
map(nxo, "<leader>X", "\"_X")

map(nxo, "<leader>s", "\"_s")
map(nxo, "<leader>S", "\"_S")

map(nxo, "<leader>c", "\"_c")
map(nxo, "<leader>C", "\"_C")

map(nxo, "<leader>d", "\"_d")
map(nxo, "<leader>D", "\"_D")

-- Enter toggles search highlighting, except in quickfix lists and the
-- command-line window, where it opens the entry or runs the command
vim.keymap.set("n", "<CR>", function()
    if vim.bo.buftype == "quickfix" or vim.fn.getcmdwintype() ~= "" then
        return "<CR>"
    end
    return "<Cmd>set hlsearch!<CR>"
end, { expr = true })

-- Toggles line numbers
map("n", "<leader>ln", ":set number!<CR>")
-- Toggles relative numbers
map("n", "<leader>lr", ":set relativenumber!<CR>")
-- Toggles line numbers and relative numbers
map("n", "<leader>lf", ":set relativenumber!<CR>:set number!<CR>")

-- Leader + h allows highlighting `l`ine or `c`olumn
-- The line number is always highlighted, so this toggles the rest of the line
map("n", "<leader>hl", function()
    vim.o.cursorlineopt = vim.o.cursorlineopt == "both" and "number" or "both"
end)
map("n", "<leader>hc", ":set cursorcolumn!<CR>")

-- Disables Ctrl + w in insert mode
map("i", "<C-w>", "")
