" Basic Configuration
filetype plugin indent on
set autoindent			" New lines inherit the indentation of the last
set tabstop=4			" Tabs macro to four spaces
set shiftwidth=4
set expandtab
set smarttab
set number			" Show line numbers
set mouse=a			" Enable mouse for scrolling
set backspace=indent,eol,start	" This is probably already taken care of, but whatever

" Hotkeys

" Tab Navigation
nnoremap <S-Right> :tabn<CR>
nnoremap <S-Left> :tabp<CR>

" Set Ctrl-Shift-/ as a cancel for slash-find highlighting
nmap <A-/> :let @/=""<CR>

" Set Ctrl-s to save, Ctrl-Shift-s to save all
nnoremap <C-s> :w<CR>
nnoremap <C-S-s> :wa<CR>

" Set Shift-Tab to de-indent
inoremap <S-Tab> <C-d>

" Bracket auto-closing
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Set Ctrl-Shift-<direction> to switch between splits
nnoremap <C-S-Left> <C-w><Left>
nnoremap <C-S-Right> <C-w><Right>
nnoremap <C-S-Up> <C-w><Up>
nnoremap <C-S-Down> <C-w><Down>

" Set Alt-<direction> to move lines
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Set ESC to exit Terminal Mode
tnoremap <ESC> <C-\><C-n>

" Set F5 to Refresh File
nnoremap <F5> :e<CR>
inoremap <F5> <ESC><F5>i

" Enable autocomplete menu
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
