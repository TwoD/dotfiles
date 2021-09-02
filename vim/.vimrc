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
call dein#add('ternjs/tern_for_vim', {'merged': 0})
" Create ctags files.
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-easytags')

call dein#add('ledger/vim-ledger')

" https://drupa.org/project/vimrc.
if !empty(glob('~/.drush/vimrc/bundle'))
  call dein#local('~/.drush/vimrc/bundle')
endif
call dein#local('~/.vim/bundle')
call dein#end()
if dein#check_install()
  call dein#install()
  if !empty(glob('~/.vim/bundle/repos/github.com/ternjs/tern_for_vim'))
    :echom "Installing dependencies for Tern"
    :echom system('cd ~/.vim/bundle/repos/github.com/ternjs/tern_for_vim && npm install')
  endif
endif

filetype plugin indent on

let g:easytags_suppress_ctags_warning = 1 
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
set expandtab
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

" gp to select last paste https://vim.fandom.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" For ledger
let g:ledger_decimal_sep = ','
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
let g:ledger_fold_blanks = 1
let g:ledger_align_at=80
function LedgerSort()
    :%! ledger -f - print --sort 'date'
    :%LedgerAlign
endfunction
command LedgerSort call LedgerSort()

autocmd Filetype ledger setlocal shiftwidth=4 tabstop=4 noai
