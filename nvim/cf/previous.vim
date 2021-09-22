" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
    if winnr('$') <= 1
        return
    endif
    noautocmd silent! wincmd p
    if a:mode == 0
        exec "normal! \<c-y>"
    elseif a:mode == 1
        exec "normal! \<c-e>"
    elseif a:mode == 2
        exec "normal! ".winheight('.')."\<c-y>"
    elseif a:mode == 3
        exec "normal! ".winheight('.')."\<c-e>"
    elseif a:mode == 4
        normal! gg
    elseif a:mode == 5
        normal! G
    elseif a:mode == 6
        exec "normal! \<c-u>"
    elseif a:mode == 7
        exec "normal! \<c-d>"
    elseif a:mode == 8
        exec "normal! k"
    elseif a:mode == 9
        exec "normal! j"
    endif
    noautocmd silent! wincmd p
endfunc


noremap <silent><M-k> :call Tools_PreviousCursor(0)<cr>
noremap <silent><M-j> :call Tools_PreviousCursor(1)<cr>
noremap <silent><M-p> :call Tools_PreviousCursor(2)<cr>
noremap <silent><M-n> :call Tools_PreviousCursor(3)<cr>

inoremap <silent><M-k> <c-\><c-o>:call Tools_PreviousCursor(0)<cr>
inoremap <silent><M-j> <c-\><c-o>:call Tools_PreviousCursor(1)<cr>
inoremap <silent><M-p> <c-\><c-o>:call Tools_PreviousCursor(2)<cr>
inoremap <silent><M-n> <c-\><c-o>:call Tools_PreviousCursor(3)<cr>


