
let g:Lf_MruMaxFiles = 2048


let g:Lf_CacheDirectory = expand('~/.nvim/cache')

let g:Lf_WildIgnore = {
      \ 'dir': ['.root','.svn','.git','.hg','.ccls-cache','build','.cache'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so']
      \}
      
let g:Lf_WindowHeight = 0.30
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_ShowRelativePath = 0


noremap <c-s> :<c-u><c-r>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
xnoremap <c-s> :<c-u><c-r>=printf("Leaderf! rg --current-buffer -e %s ", leaderf#Rg#visual())<CR><CR>



noremap <silent> <c-f> :LeaderfFunction<CR>
noremap <silent> <c-m> :LeaderfMru<CR>
noremap <silent> <c-p> :LeaderfFile<CR>
