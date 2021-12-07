
vim.api.nvim_command([[

  nmap <space>e <Cmd>CocCommand explorer --position floating<CR>
  autocmd FileType coc-explorer setlocal norelativenumber
  autocmd BufEnter coc-explorer if &ft == 'coc-explorer'| call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh']) | endif
]])