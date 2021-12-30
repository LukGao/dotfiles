
vim.cmd[[

autocmd BufWritePre *.go,*.js,*.html :silent! CocCommand prettier.formatFile
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif 
" 根据搜索结果折叠
nnoremap zpr :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

vnoremap // y/<c-r>"<CR>   "

function! ToUTF8()
    set fileencoding=utf-8
    set fileformat=unix
    w
endfunction


autocmd BufWritePre *.cpp,*.lua,*.c,*.h,*.hpp :silent! call ToUTF8()
autocmd BufWritePre *.cpp,*.lua,*.c,*.h,*.hpp :%retab

]]
