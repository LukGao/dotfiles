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
"set cursorcolumn              " 高亮列
"set cursorline                " 高亮显示当前行
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
set tabstop=4               " 设置编辑时制表符占用空格数
set shiftwidth=4            " 设置格式化时制表符占用空格数
set softtabstop=4           " 设置2个空格为制表符
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
nnoremap <space><space> %
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
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" icon
Plug 'ryanoasis/vim-devicons'
" line
Plug 'bagrat/vim-buffet'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" lsp clinet
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggyyll/spaceline.vim'
Plug 'ggyyll/vim_equinusocio_material'
Plug 'sainnhe/gruvbox-material', { 'branch': 'neosyn' }
Plug 'sheerun/vim-polyglot'




" terminal
Plug 'voldikss/vim-floaterm'
" man page
Plug 'vim-utils/vim-man',               {'for':['c','cpp','cc']}
" bookmark
Plug 'MattesGroeger/vim-bookmarks'
Plug 'voldikss/vim-translate-me'

Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'mzlogin/vim-kramdown-tab'
Plug 'iamcco/markdown-preview.nvim'


Plug 'mg979/vim-visual-multi',          {'branch': 'test'} "多行编辑
Plug 'mbbill/undotree'                  " 后悔药
Plug 'mhinz/vim-startify'               " 启动页
Plug 'luochen1990/rainbow'              " 多彩括号
Plug 'neomake/neomake'
Plug 'honza/vim-snippets',              {'for':['go','c','cpp','cc','py']}                  " 代码片段
Plug 'Chiel92/vim-autoformat' ,         {'for':['c','cpp','cc']}
Plug 'scrooloose/nerdtree',             { 'on':'NERDTreeToggle'}
Plug 'majutsushi/tagbar',               { 'on':'TagbarToggle'}
Plug 'tpope/vim-endwise',               {'for':['c','cpp','cc']}                            " endif补全
Plug 'tpope/vim-surround',              {'for':['go','c','cpp','cc','py']}                  " 成双成对编辑
Plug 'scrooloose/nerdcommenter',        {'for':['go','c','cpp','cc','py']}                  " 注释插件
Plug 'lfv89/vim-interestingwords',      {'for':['go','c','cpp','cc','py']}                  " 单词标记
Plug 'ntpeters/vim-better-whitespace',  {'for':['go','c','cpp','cc','py']}                  " 去除空格
Plug 'tpope/vim-abolish'             ,  {'for':['go','c','cpp','cc','py']}                  " 命名风格转换
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim python3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog  = '/usr/bin/python3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<tab>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
   \ pumvisible() ? coc#_select_confirm() :
   \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
   \ <SID>check_back_space() ? "\<TAB>" :
   \ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_global_extensions =['coc-snippets','coc-neosnippet','coc-python','coc-pairs','coc-json','coc-imselect','coc-highlight','coc-git','coc-emoji','coc-lists','coc-yaml','coc-template']

set updatetime=300
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorHold * sil call CocActionAsync('highlight')
autocmd CursorHoldI * sil call CocActionAsync('showSignatureHelp')
filetype plugin indent on


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 特殊技能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap // y/<c-r>"<CR>   "
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif " 打开文件自动定位到最后编辑的位置
nnoremap zpr :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prepare-code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
autocmd TextChangedI * GitGutter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_foote = [
      \ '+------------------------------+',
      \ '|  1.01 ^ 365 =  37.78         |',
      \ '+----------------+-------------+',
      \]
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(startify#fortune#cowsay())
let g:startify_custom_footer = s:center(g:startify_custom_foote)
let g:startify_padding_left = 30


let g:better_whitespace_enabled=1
let g:strip_whitespace_confirm=0
set viminfo='100,n$HOME/.vim/files/info/viminfo


" Theme
set t_Co=256
set termguicolors
set background=dark
let g:gruvbox_material_background = '𝒔𝒐𝒇𝒕'
colorscheme gruvbox-material

let g:equinusocio_material_style='darker'
let g:equinusocio_material_vertsplit='visible'
"colorscheme equinusocio_material


hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi default CocHighlightText  guibg=#725972 ctermbg=96
" ---------------------------------------------------------

let g:bookmark_sign = '⚑'
let g:bookmark_highlight_lines = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', '#5f5f87'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

"let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  let height = float2nr(&lines/2)
  let width = float2nr(&columns - (&columns * 2 / 10))
  "let width = &columns
  let row = float2nr(&lines / 3)
  let col = float2nr((&columns - width) / 3)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
endfunction

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = ' --preview "rougify {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' ,
        \ 'window': 'call FloatingFZF()'})

endfunction


autocmd User Startified setlocal buflisted
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <localleader>pa :StripWhitespace<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" translate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>t <Plug>Translate
vmap <silent> <leader>t <Plug>TranslateV
nmap <silent> <leader>w <Plug>TranslateW
vmap <silent> <leader>w <Plug>TranslateWV



imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <expr><TAB>  pumvisible() ? "\<C-n>" :  <SID>check_back_space() ? "\<TAB>":  coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nnoremap <silent> <localleader>k :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <localleader>u :UndotreeToggle<cr>
nnoremap <localleader>g :TagbarToggle<CR>
nnoremap <localleader>ft :Autoformat<CR>
nnoremap <localleader>n :NERDTreeToggle <CR>


nnoremap <silent> <localleader>c :Colors<CR>
nnoremap <silent> <localleader>b :Buffers<CR>
nnoremap <silent> <localleader>f :call Fzf_dev()<CR>
nnoremap <silent> <localleader>r :Rg<CR>
nnoremap <silent> <localleader>w :Rg <C-R><C-W><CR>
nnoremap <silent> <localleader>m :History<CR>


map <localleader>v <Plug>(Vman)
"
let g:table_mode_corner = '|'
let g:table_mode_border=0
let g:table_mode_fillchar=' '

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" bases
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

nn xx x


call neomake#configure#automake('w')



" linx

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

let g:buffet_tab_icon = "\uf00a"
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=106 ctermfg=8 guibg=#b8bb26 guifg=#000000
    hi! BuffetTrunc cterm=bold ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
    hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#999999 guifg=#504945
endfunction
let g:buffet_show_index = 1
let g:buffet_left_trunc_icon = "<"
let g:buffet_right_trunc_icon = ">"


" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
	if winnr('$') <= 1
		return
	endif
	noautocmd silent! wincmd p
	if a:mode == 0
		exec "normal! \<c-y>"
	elseif a:mode == 1
		exec "normal! \<c-e>"
	elseif a:mode == 2
		exec "normal! ".winheight('.')."\<c-y>"
	elseif a:mode == 3
		exec "normal! ".winheight('.')."\<c-e>"
	elseif a:mode == 4
		normal! gg
	elseif a:mode == 5
		normal! G
	elseif a:mode == 6
		exec "normal! \<c-u>"
	elseif a:mode == 7
		exec "normal! \<c-d>"
	elseif a:mode == 8
		exec "normal! k"
	elseif a:mode == 9
		exec "normal! j"
	endif
	noautocmd silent! wincmd p
endfunc


noremap <silent><M-j> :call Tools_PreviousCursor(0)<cr>
noremap <silent><M-k> :call Tools_PreviousCursor(1)<cr>
noremap <silent><M-p> :call Tools_PreviousCursor(2)<cr>
noremap <silent><M-n> :call Tools_PreviousCursor(3)<cr>

inoremap <silent><M-j> <c-\><c-o>:call Tools_PreviousCursor(0)<cr>
inoremap <silent><M-k> <c-\><c-o>:call Tools_PreviousCursor(1)<cr>
inoremap <silent><M-p> <c-\><c-o>:call Tools_PreviousCursor(2)<cr>
inoremap <silent><M-n> <c-\><c-o>:call Tools_PreviousCursor(3)<cr>

