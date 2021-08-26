" set leader key
let g:mapleader = ","

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                                   " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set noswapfile                          " Stop creating swap files
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

"" ignored files
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/coverage/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

if has("termguicolors")
  set termguicolors
endif

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

au FocusGained,BufEnter * :checktime " reloads the file

" Undo
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
if has("persistent_undo")
  set undodir=~/.config/nvim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif

" You can't stop me
cmap w!! w !sudo tee %

" Delete trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Highlight current word matches
autocmd CursorMoved * silent! exe printf('match SpellLocal /\<%s\>/', expand('<cword>'))

" Ruby provider
let g:ruby_host_prog = '/Users/rocela/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

" Insert pry
au FileType ruby nmap <Leader>pr obinding.pry<ESC>:w<CR>

" Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec set filetype=ruby

" rails-decorators
au BufNewFile,BufRead *.decorator set filetype=ruby

" Slim
au BufNewFile,BufRead *.slim setlocal filetype=slim

" Turn on spellcheck
autocmd Filetype gitcommit,markdown,note setlocal spell textwidth=72
autocmd Filetype gitcommit,markdown,note setlocal complete+=kspell

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif |


" linters
" autocmd! BufReadPost,BufWritePost * Neomake
call neomake#configure#automake('w')
let g:neomake_tempfile_dir = '/tmp/neovim'
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_ruby_reek_maker_errorformat =
        \ '%E%.%#: Racc::ParseError: %f:%l :: %m,' .
        \ '%W%f:%l: %m'
let g:neomake_ruby_reek_maker = {
    \ 'args': ['--single-line'],
    \ 'errorformat': g:neomake_ruby_reek_maker_errorformat,
    \ }
let b:neomake_ruby_rubocop_exe = "/Users/rocela/.rbenv/versions/2.6.3/bin/rubocop"
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" rspec
let g:rspec_command = "!rspec --drb --color {spec}"

" Syntastic linters
let g:syntastic_scss_checkers = ['scss_lint']

" Ack https://github.com/mileszs/ack.vim
" let g:ackpreview = 0
" ag with the silver search
if executable('ag')
  let g:ackprg = 'ag --vimgrep --unrestricted'
endif
