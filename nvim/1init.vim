"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","           " 定义<leader>键
let g:maplocalleader = ';'
set clipboard=unnamed         " 共享系统剪切板
set nocompatible              " 设置不兼容原始vi模式
set t_Co=256                  " 开启256色支持
set nu
set showcmd                   " select模式下显示选中的行数
set cursorcolumn              " 高亮列
set cursorline                " 高亮显示当前行
set ttimeoutlen=0             " 设置<ESC>键响应时间
set virtualedit=block,onemore " 允许光标出现在最后一个字符的后面
set laststatus=2              " 总是显示状态栏
set showtabline=2
set noshowmode
"set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab               " 将制表符扩展为空格
set tabstop=2               " 设置编辑时制表符占用空格数
set shiftwidth=2            " 设置格式化时制表符占用空格数
set softtabstop=2           " 设置2个空格为制表符
set smarttab                " 在行和段开始处使用制表符
set nowrap                  " 禁止折行
set backspace=2             " 使用回车键正常处理indent,eol,start等
set sidescroll=10           " 设置向右滚动字符数
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <esc>
nnoremap <leader>v :sp<CR>
nnoremap <leader>h :vs<CR>
nnoremap <space><space> %
nnoremap <leader>bg m1^~`1
inoremap <leader>bg <ESC>gUiwgi
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <leader>q :q!<CR>
nnoremap <localleader>e :edit $MYVIMRC<cr>           " 编辑vimrc文件
" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件安装LINX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'liuchengxu/space-vim-dark'
Plug 'taigacute/gruvbox9'
Plug 'google/vim-colorscheme-primary'
Plug 'chxuan/change-colorscheme'
Plug 'liuchengxu/vista.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hotoo/pangu.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'neoclide/coc.nvim',               {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'mg979/vim-visual-multi',          {'branch': 'test','for':['go','vim','cc','c','cpp','py']} "多行编辑
Plug 'mbbill/undotree'                  " 后悔药
Plug 'mhinz/vim-startify'               " 启动页
Plug 'Yggdroot/LeaderF'                 " 神器，函数，文件，搜索
Plug 'luochen1990/rainbow'              " 多彩括号
Plug 'jiangmiao/auto-pairs'             " 括号补全
Plug 'chxuan/prepare-code',              {'for':['c','cpp','cc']} " 代码片段

Plug 'Chiel92/vim-autoformat' ,         {'for':['c','cpp','cc']}
Plug 'scrooloose/nerdtree',             { 'on':'NERDTreeToggle'}
Plug 'majutsushi/tagbar',               { 'on':'TagbarToggle'}
Plug 'tpope/vim-endwise',               {'for':['c','cpp','cc']}                            " endif补全
Plug 'tpope/vim-surround',              {'for':['go','c','cpp','cc','py']}                  " 成双成对编辑
Plug 'scrooloose/nerdcommenter',        {'for':['go','c','cpp','cc','py']}                  " 注释插件
Plug 'lfv89/vim-interestingwords',      {'for':['go','c','cpp','cc','py']}                  " 单词标记
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'voldikss/vim-translate-me'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
call plug#end() 

nnoremap <localleader>ft :Autoformat<CR>



imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:python3_host_prog  = '/usr/bin/python3'

let g:space_vim_plugin_hi_groups = 1
"nerdtree
nnoremap <localleader>n :NERDTreeToggle <CR>
let nerdtreequitonopen = 0
let NERDTreeShowHidden=0
let nerdchristmastree=1
let g:nerdtreewinsize = 15
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:nerdtreeindicatormapcustom = {
      \ "modified"  : "✹",
      \ "staged"    : "✚",
      \ "untracked" : "✭",
      \ "renamed"   : "➜",
      \ "unmerged"  : "═",
      \ "deleted"   : "✖",
      \ "dirty"     : "✗",
      \ "clean"     : "✔︎",
      \ 'ignored'   : '☒',
      \ "unknown"   : "?"
      \ }


let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
nnoremap <silent> <localleader>ca  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <localleader>ce  :<C-u>CocList extensions<cr>
nnoremap <silent> <localleader>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <localleader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <localleader>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <localleader>cj  :<C-u>CocNext<CR>
nnoremap <silent> <localleader>ck  :<C-u>CocPrev<CR>
nnoremap <silent> <localleader>cr  :<C-u>CocListResume<CR>
nmap <silent> ]c <Plug>(coc-diagnostic-prev)
nmap <silent> [c <Plug>(coc-diagnostic-next)
vmap <localleader>cf  <Plug>(coc-format-selected)
nmap <localleader>cf  <Plug>(coc-format-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>":
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
filetype plugin indent on     " required!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>g :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds' : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin' : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>u :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 特殊技能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif " 打开文件自动定位到最后编辑的位置
nnoremap zpr :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>
let g:rainbow_active = 1
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
nmap <localleader>gv <Plug>(go-def-vertical)
nmap <localleader>gi <Plug>(go-info)
nmap <localleader>gd <Plug>(go-doc)
nmap <localleader>gr <Plug>(go-run)
nmap <localleader>gb <Plug>(go-build)
nmap <localleader>gt <Plug>(go-test)
nmap <localleader>gc <Plug>(go-coverage)
nmap <localleader>gr <Plug>(go-rename)


let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
" ---------------------------------------------------------
highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
au TextChangedI * GitGutter


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <localleader>m :LeaderfMru<cr>
noremap <localleader>t :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.20
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}
let g:Lf_WildIgnore = {
      \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" json 格式化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Jsonf :execute '%!python -m json.tool'
      \ | :execute '%!python -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_foote = [
            \ '+------------------------------+',
            \ '|  1.01 ^ 365 =  37.78         |',
            \ '+----------------+-------------+',
            \]
function! s:filter_header(lines) abort
	let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
	let longest_line   = 30
	let centered_lines = map(copy(a:lines),
	\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

function! s:filter_footer(lines) abort
	let longest_line   = min(map(copy(a:lines), 'strwidth(v:val)'))
	let longest_line   = 25
	let centered_lines = map(copy(a:lines),
	\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(startify#fortune#cowsay())
let g:startify_custom_footer = s:filter_footer(g:startify_custom_foote)
set viminfo='100,n$HOME/.vim/files/info/viminfo
let g:startify_padding_left = 30
let g:better_whitespace_enabled=1
let g:strip_whitespace_confirm=0
autocmd FileType sh,cpp,c,go autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map  <localleader>  <Plug>（easymotion - prefix）
" Move to line
map <localleader>l <Plug>(easymotion-bd-jk)
nmap <localleader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <localleader>sd <Plug>(easymotion-bd-w)
nmap <localleader>sd <Plug>(easymotion-overwin-w)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

"nmap s <Plug>(easymotion-overwin-f2)
"
noremap <silent><expr> s  incsearch#go(<SID>config_easyfuzzymotion())
map <localleader>/ <Plug>(incsearch-fuzzy-/)

vnoremap // y/<c-r>"<CR>   "

" <Leader>t 翻译光标下的文本，在命令行回显翻译内容
nmap <silent> <leader>t <Plug>Translate
vmap <silent> <leader>t <Plug>TranslateV
" leader>w 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <leader>w <Plug>TranslateW
vmap <silent> <leader>w <Plug>TranslateWV








let g:lightline = {
      \ 'colorscheme': 'gruvbox9',
      \ 'active': {
      \   'left': [ ['homemode'],
      \             ['fugitive', 'gitgutter'],['filename']],
      \   'right':[ ['lineinfo'],
      \             ['percent'], ['fileformat'],['fileencoding'] ],
      \ },
      \ 'inactive': {
      \   'left': [['homemode'], ['filename']],
      \   'right':[['lineinfo'], ['percent']],
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['ooknn']],
      \ },
      \ 'component': {
      \   'lineinfo': "\ue265 %3l:%-2v",
      \   'ooknn': "\uf299 ",
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'cocerror': 'LightLineCocError',
      \   'cocwarn' : 'LightLineCocWarn',
      \ },
      \ 'component_function': {
      \   'homemode': 'LightlineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'gitgutter': 'LightLineGitGutter',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFname',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'separator': { 'left': "", 'right': ""},
      \ 'subseparator': { 'left': "", 'right': ""}
      \ }

function! LightlineMode()
  let nr = s:get_buffer_number()
  let nmap = [ '⓿ ',  '❶ ',  '❷ ',  '❸ ', '❹ ','❺ ',  '❻ ',  '❼ ',  '❽ ',  '❾ ','➓ ','⓫ ','⓬ ','⓭ ','⓮ ','⓯ ','⓰ ','⓱ ','⓲ ','⓳ ','⓴ ']
  if nr == 0
    return ''
  endif
  let l:number = nr
  let l:result = ''
  for i in range(1, strlen(l:number))
    let l:result = get(nmap, l:number % 10, l:number % 10) . l:result
    let l:number = l:number / 10
  endfor
  return join(['',l:result])
endfunction
function! s:get_buffer_number()
  let i = 0
  for nr in filter(range(1, bufnr('$')), 'bufexists(v:val) && buflisted(v:val)')
    let i += 1
    if nr == bufnr('')
      return i
    endif
  endfor
  return ''
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineCocError()
  let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, error_sign . info['error'])
  endif
  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn() abort
  let warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, warning_sign . info['warning'])
  endif
 return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

autocmd User CocDiagnosticChange call lightline#update()

function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = ['+','~','-']
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! LightLineFname() 
  let icon = (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') 
  let filename = LightLineFilename()
  let ret = [filename,icon]
  if filename == ''
    return ''
  endif
  return join([filename, icon],'')
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
      \ 0: '⓿ ', 1: '❶ ', 2: '❷ ', 3: '❸ ', 4: '❹ ',
      \ 5: '❺ ', 6: '❻ ', 7: '❼ ', 8: '❽ ', 9: '❾ '}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)



" Theme

" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
	set termguicolors
endif

set background=dark
colorscheme gruvbox9_hard
"colorscheme space-vim-dark
"colorscheme primary
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1


hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi default CocHighlightText  guibg=#725972 ctermbg=96
" ---------------------------------------------------------
hi PMenuSel ctermfg=252 ctermbg=106 guifg=#d0d0d0 guibg=#859900 guisp=#859900 cterm=NONE gui=NONE

highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
highlight def link Defx_filename_3_Untracked Comment
highlight def link Defx_filename_3_Unknown Comment
highlight def link Defx_filename_3_Renamed Title
highlight def link Defx_filename_3_Unmerged Label


nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '⚑'
let g:bookmark_highlight_lines = 1
let g:interestingWordsGUIColors = ['#EE7AE9','#8B7B8B','#9B30FF','#8B8B7A','#aeee00', '#ff0000','#40E0D0', '#b88823', '#ffa724', '#ff2c4b']
