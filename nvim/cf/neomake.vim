let g:neomake_tempfile_dir = '~/.vim/tmp/neomake'
let g:neomake_cpp_enable_makers = ['clang']
let g:neomake_cpp_clang_maker = {'exe' : 'clang' }
let g:neomake_cpp_clang_args = ['--std=c++17','--analyze']
silent! call neomake#configure#automake('w')
