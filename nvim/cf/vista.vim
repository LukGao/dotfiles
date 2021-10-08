let g:vista#executive#ctags#support_json_format = 1
let g:vista#executives = ['coc']
let g:vista#render#ctags = 'default'
let g:vista#renderer#ctags = 'default'
let g:vista#renderer#default#vlnum_offset = 3
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "namespace": "{}",
\   "class": "@",
\   "function": "𝒇",
\   "method": "@𝒇",
\   "variable": "𝑥",
\   "field": "@𝑥",
\   "interface": "I",
\   "constant": "&",
\}
let g:vista_cursor_delay = 0
let g:vista_sidebar_width = 35
let g:vista_stay_on_open = 0
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

nnoremap <localleader>g :Vista!!<CR>

nnoremap <C-f> :Vista finder coc<CR>
