" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_start_length = 2
call deoplete#custom#option('auto_complete_start_length', 2)
call deoplete#custom#source('_', 'max_candidates', 3)
call deoplete#custom#source('buffer', 'rank', 501)
call deoplete#custom#source('buffer', 'max_candidates', 2)
call deoplete#custom#source('tabnine', 'rank', 50)

" use tab
imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" omnifuncs
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
