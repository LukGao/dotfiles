let g:Lf_UseCache = 0
let g:Lf_HideHelp = 1
let g:Lf_MruMaxFiles = 2048
let g:Lf_WindowHeight = 0.30
let g:Lf_UseMemoryCache = 0
let g:Lf_ShowRelativePath = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_WildIgnore = {
      \ 'dir': ['.root','.svn','.git','.hg','.ccls-cache','build','.cache'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so']
      \}
      
let g:Lf_NormalMap = {
      \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
      \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
      \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
      \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
      \ "BufTag":    [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<CR>']],
      \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
      \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
      \ }

noremap <c-s> :<c-u><c-r>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
xnoremap <c-s> :<c-u><c-r>=printf("Leaderf! rg --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>

noremap <silent> <c-f> :LeaderfFunction<CR>
noremap <silent> <c-m> :LeaderfMru<CR>
