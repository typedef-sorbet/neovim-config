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
set relativenumber
set nowrap
set listchars=trail:•
set scrolloff=10
set sidescrolloff=10
set splitright
set clipboard+=unnamedplus
set confirm

" Leader remap

let mapleader="\<space>"

" Hotkeys

" Maps stolen from Jess Archer's wonderful Vimconf 2021 talk (https://www.youtube.com/watch?v=434tljD-5C8)

" Open the current file in the default program
nnoremap <leader>x :!xdg-open %<cr><cr>

" Allow gf to open non-existent files
map gf :edit <cfile><CR>

" Now, back to my own creations...

" Re-source config
nnoremap <leader>vs :source ~/.config/nvim/init.vim<CR>

" Edit config in new split (opens file browser in rc directory)
nnoremap <leader>ve :vsplit <bar> :edit ~/.config/nvim/rc<CR>

" Edit plugin config in new split
nnoremap <leader>vpe :vsplit <bar> :edit ~/.config/nvim/rc/vundle.vimrc<CR>

" Install plugins
nnoremap <leader>vpi :PluginInstall<CR>

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

function! SudoWrite()
    w !sudo tee % > /dev/null
endfunction

function! SudoWriteAndReopen()
    call SudoWrite()
    e!
    call feedkeys("\<CR>")
endfunction

function! SudoWriteQuit()
    call SudoWriteAndReopen()
    q
endfunction

function! SudoWriteNext()
    call SudoWriteAndReopen()
    n
endfunction

" Allow sudo-writing via :Sw, :Swq, :Swn
command! -nargs=0 Sw call SudoWriteAndReopen()
command! -nargs=0 Swq call SudoWriteQuit()
command! -nargs=0 Swn call SudoWriteNext()

" Switch tab-completion arrow keys to do breadth on up/down, depth on
" left/right
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" Allow code-folding on indentation
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Use c for toggling checkboxes in Markdown
nnoremap <C-x> <leader>tt
