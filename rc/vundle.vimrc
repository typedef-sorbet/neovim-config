set nocompatible		" be iMproved, required
filetype off			" required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" Vim Plugins via Vundle

Plugin 'VundleVim/Vundle.vim'	" Let Vundle manage Vundle, required

" Functionality Plugins
Plugin 'vifm/vifm.vim'
Plugin 'preservim/nerdcommenter'

" Look-and-Feelers
Plugin 'itchyny/lightline.vim'
Plugin 'doums/darcula'
Plugin 'dracula/vim'

" QML Syntax Highlighting
Plugin 'calincru/qml.vim'

" Markdown Syntax Highlighting
Plugin 'gabrielelana/vim-markdown'

" End Plugins
call vundle#end()
filetype plugin indent on

