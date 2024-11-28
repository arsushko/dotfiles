" Movement keys rebound to neio
noremap n h
noremap e j
noremap i k
noremap o l
noremap ge gj
noremap gi gk

" Insert mode now bound to l
noremap l i
noremap L I
noremap gl gi

" Search result navigation with k
noremap k n
noremap K N
" Search forward/backward and select
noremap gk gn
noremap gK gN
noremap gn <nop>
noremap gN <nop>
noremap go <nop>
noremap gO <nop>

" Insert mode with newline is now on h
noremap h o
noremap H O

" Lower case j joins lines
noremap - J

" j moves to end of word
noremap j e
noremap J E

" Hack to work around conflict with `d`elete `i`n
nnoremap di dk
nnoremap dd dd

" ze and zi move cursor to top/bottom of visible screen
noremap ze L
noremap zi H

" Creating newline without insert mode
noremap <C-k> o<Esc>o
noremap <C-S-K> O<Esc>O

" Movement between previous motions
noremap <C-H> <C-O>
noremap <C-S-H> <C-I>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Y consistent with D and C to the end of line
nnoremap Y y$

" W and B move to beginning/end of word inclusive
noremap W e
noremap B gE

" E and I function like PageUp/Down
noremap E <C-f>
noremap I <C-b>

" Disables the arrow keys
noremap <Left> <nop>
noremap <Down> <nop>
noremap <Up> <nop>
noremap <Right> <nop>

inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>

" Disables Ctrl + w in insert mode
inoremap <C-w> <nop>

" Obsidian edits
" Source: https://www.reddit.com/r/ObsidianMD/comments/16b3fxn/opening_link_under_cursor_with_obsidian_vimrc/
" Sets Enter to follow links
exmap followLink :obcommand editor:follow-link
nmap <CR> :followLink<CR>

" Source: https://notes.bauer.codes/Obsidian#Obsidian+vim+window+controls
" Emulate Original gt and gT https://vimhelp.org/tabpage.txt.html#gt
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nmap gt :nextTab<CR>
nmap gT :prevTab<CR>

" Emulate Original Folding command https://vimhelp.org/fold.txt.html#fold-commands
exmap unfoldall obcommand editor:unfold-all
exmap togglefold obcommand editor:toggle-fold
exmap foldall obcommand editor:fold-all
exmap foldless obcommand editor:fold-less
exmap foldmore obcommand editor:fold-more
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>
nmap zm :foldmore<CR>
nmap zM :foldall<CR>
nmap zr :foldless<CR>
nmap zR :unfoldall<CR>

" Yank to system clipboard
set clipboard=unnamed
set tabstop=4

" Source: https://github.com/chrisgrieser/.config/blob/41a9e915ec0b299084cf58f4265fb2f3a39e4643/obsidian/obsidian-vimrc.vim
" don't pollute the register (HACK since we can't map to `"_x` or `"_C`)
nnoremap C "_c$
nnoremap x "_dl

" undo/redo consistently on one key
nnoremap U <C-r>
