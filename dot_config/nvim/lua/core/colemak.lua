---------------------------------------------------------------
-- Colemak remappings
-- Only loaded when colemak is enabled in .chezmoidata.toml
---------------------------------------------------------------

-- Non-recursive by default; an empty command maps to <Nop>
local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, { silent = true })
end

-- Normal, visual and operator-pending modes. Unlike "", this leaves out
-- Select mode, where typed keys should replace the selection
local nxo = { "n", "x", "o" }

-- Movement keys rebound to neio
map(nxo, "n",  "h")
map(nxo, "e",  "j")
map(nxo, "i",  "k")
map(nxo, "o",  "l")
map(nxo, "ge", "gj")
map(nxo, "gi", "gk")

-- Insert mode now bound to l
map(nxo, "l", "i")
map(nxo, "L", "I")
map(nxo, "gl", "gi")

-- Moving to top/bottom of screen
map(nxo, "N", "L")
map(nxo, "O", "H")

-- Search result navigation with k
map(nxo, "k",  "n")
map(nxo, "K",  "N")
-- Search forward/backward and select
map(nxo, "gk", "gn")
map(nxo, "gK", "gN")
map(nxo, "gn", "")
map(nxo, "gN", "")
map(nxo, "go", "")
map(nxo, "gO", "")

-- Insert mode with newline is now on h
map(nxo, "h", "o")
map(nxo, "H", "O")

-- Ctrl + k opens a line below with a blank line in between, like starting a
-- new paragraph. Ctrl + Shift + k does the same above
map("n", "<C-k>",   "o<Esc>o")
map("n", "<C-S-K>", "O<Esc>O")

-- E and I function like PageUp/Down
map(nxo, "E", "<C-f>")
map(nxo, "I", "<C-b>")

-- - joins lines
map(nxo, "-", "J")

-- Movement between previous motions
map(nxo, "<C-H>",   "<C-O>")
map(nxo, "<C-S-H>", "<C-I>")

-- j moves to end of word
map(nxo, "j",  "e")
map(nxo, "J",  "E")

-- Easy window switching
map("n", "<leader>n", "<Cmd>wincmd h<CR>")
map("n", "<leader>e", "<Cmd>wincmd j<CR>")
map("n", "<leader>i", "<Cmd>wincmd k<CR>")
map("n", "<leader>o", "<Cmd>wincmd l<CR>")
