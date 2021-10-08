inoremap <silent><expr> <TAB>
   \ pumvisible() ? coc#_select_confirm() :
   \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
   \ <SID>check_back_space() ? "\<TAB>" :
   \ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_global_extensions =['coc-tabnine','coc-snippets','coc-cmake','coc-pairs','coc-json','coc-highlight','coc-emoji','coc-lists','coc-yaml','coc-vetur', 'coc-eslint', 'coc-translator' , 'coc-emmet', 'coc-css', 'coc-html','coc-prettier', 'coc-tsserver']

set updatetime=300
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorHold * sil call CocActionAsync('highlight')
autocmd CursorHoldI * sil call CocActionAsync('showSignatureHelp')
filetype plugin indent on


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <expr><TAB>  pumvisible() ? "\<C-n>" :  <SID>check_back_space() ? "\<TAB>":  coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <silent> <localleader>k :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
""
nmap <leader>rn <Plug>(coc-rename)

nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
nn <silent> xj :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent> xh :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent> xl :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent> xk :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>
nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn xx x


nmap <localleader>a <Plug>(coc-refactor)

function! CocCurrentFunction()
    let currentFunctionSymbol = get(b:, 'coc_current_function', '')
    return currentFunctionSymbol !=# '' ? "\uf6a6 " .currentFunctionSymbol : 'no symbol'
endfunction

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


