func! LangSelector()
    let g:translator_target_lang = 'en'
endfunc
nmap <silent> <Leader>l :call LangSelector()<CR>
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
