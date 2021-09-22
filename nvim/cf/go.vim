autocmd User Startified setlocal buflisted
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

