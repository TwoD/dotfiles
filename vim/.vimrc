" Allow Vim-only settings even if they break vi keybindings.
set nocompatible

" Avoid potential issues from using Fish as the default shell.
if $SHELL =~ '/usr/bin/fish'
 set shell=/bin/sh
endif

syntax on
" 
filetype plugin on
" End of vimrc-install additions.
source $VIMRUNTIME/vimrc_example.vim

" Using https://github.com/Shougo/dein.vim to manage runtimepath and plugins.
set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
if empty(glob('~/.vim/bundle'))
  mkdir('~/.vim/bundle', 'p')
endif
call dein#begin('~/.vim/bundle')
" Dein manages itself.
call dein#add('Shougo/dein.vim')
" EditorConfig support
call dein#add('editorconfig/editorconfig-vim')
" Fugigive, git wrapper.
call dein#add('tpope/vim-fugitive')
" NERDCommenter, multiline commenter.
call dein#add('scrooloose/nerdcommenter')
" NERDTree, filetree pane.
call dein#add('scrooloose/nerdtree')
" Syntastic, flexible syntax checker.
call dein#add('scrooloose/syntastic')
" Snipmante, snippet autocompleter.
call dein#add('msanders/snipmate.vim')
" Tagbar, Exuberant ctags support.
call dein#add('majutsushi/tagbar')
" Twig theme file syntax suppert
call dein#add('evidens/vim-twig')
" Vdebug, Xdebug-compatible debugger.
call dein#add('joonty/vdebug')
" Tern for Vim, use exuberant ctags with ternjs.
call dein#add('ternjs/tern_for_vim')
" Create ctags files.
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-easytags')
" https://drupa.org/project/vimrc.
if !empty(glob('~/.drush/vimrc/bundle'))
  call dein#local('~/.drush/vimrc/bundle')
endif
call dein#local('~/.vim/bundle')
call dein#end()
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on

let g:easytags_async = 1
set tags=./tags;,~/.vimtags
let g:easytags_dynamic_files = 1
set encoding=utf-8
set nobackup
set nowritebackup
set smartcase
set ignorecase
set incsearch
set noundofile
set scrolloff=4
set sidescrolloff=8
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif
