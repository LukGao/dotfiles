autocmd User Startified setlocal buflisted


autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

