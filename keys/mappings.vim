" Source with F5
map <F5> :so $MYVIMRC<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" clear highlight
map <Leader><Space> :nohlsearch<CR>

" Alternate ESC
inoremap jj <ESC>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Switch tab with tab!
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Alternate way to save
nnoremap <C-s> :w<CR>
nnoremap <Leader>, :w<CR>

" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
nnoremap <ESC><ESC> :q<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Fast jump
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open, source vimfile and install plugins
nmap <leader>vr :tabe $MYVIMRC<cr>
nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>pi :source $MYVIMRC<cr>:PlugInstall<cr>

" NERDTree configuration
let g:NERDTreeWinPos = "right"
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>m :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Comment line
map // :TComment<CR>

" ACK.vim
vnoremap <Leader>f y:Ack<Space><C-R>"<CR>
nnoremap <Leader>f :Ack<Space>

" rubocop
nmap <Leader>rc :silent !rubocop -a %<CR>

" regenerate CTAGS - https://github.com/universal-ctags/ctags
map <Leader>ct :silent !ctags -R --exclude="*min.js"<CR>

" open browser on github
nnoremap <Leader>gb :Gbrowse<CR>
