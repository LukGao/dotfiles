function! ToUTF8()
    set fileencoding=utf-8
    set fileformat=unix
    w
endfunction

nmap <leader>a :call ToUTF8()<CR>
