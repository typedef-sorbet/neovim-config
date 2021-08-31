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

" Markdown Preview
Plugin 'iamcco/markdown-preview.nvim'

" Neovim LSP base
Plugin 'neovim/nvim-lspconfig'

" LSPs


" Intentation guides
Plugin 'lukas-reineke/indent-blankline.nvim'

" Treesitter -- warning, consider experimental until nvim 0.6
Plugin 'nvim-treesitter/nvim-treesitter'

" Jinja syntax highlighting
Plugin 'glench/vim-jinja2-syntax'

" Checkbox plugin for Markdown
Plugin 'jkramer/vim-checkbox'

" End Plugins
call vundle#end()
filetype plugin indent on

