vim.g.neomake_tempfile_dir = '~/.nvim/tmp/neomake'
vim.g.neomake_cpp_enable_makers = 'clang'
vim.g.neomake_cpp_clang_maker = {exe = 'clang' }
vim.g.neomake_cpp_clang_args = {'--std=c++20','--analyze -extra-arg -Xanalyzer -extra-arg -analyzer-output=text'}

vim.cmd[[
	silent! call neomake#configure#automake('w')
]]
