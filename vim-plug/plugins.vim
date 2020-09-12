" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " File-type sensible comments for Vim
    Plug 'tomtom/tcomment_vim'
    " Must have from tpope
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'


    " Themes and airline
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " FZF https://www.chrisatmachine.com/Neovim/08-fzf/
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'mileszs/ack.vim'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'
    Plug 'rhysd/committia.vim'
    Plug 'rhysd/git-messenger.vim'
    Plug 'junegunn/gv.vim'

    " Autocomplete
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'benekastah/neomake'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-syntax'
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

    " Syntax
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
    Plug 'slim-template/vim-slim', { 'for': ['slim'] }

call plug#end()
