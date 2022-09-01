function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
			\ 'help' : 'navigate available tasks from asynctasks.vim',
		\ }


lua << EOF
function BuildTask(project)
    local log = "info"
    local status = "success"
    if vim.g.asyncrun_code ~= 0 then
        log = "error"
        status = "fail"
    end
    require("notify")(project .. " task finish",err,{title ="async build"})
 end
EOF


nnoremap <silent><nowait> <localleader>r  :Leaderf --nowrap task --popup<cr>

if has("persistent_undo")
    let target_path = expand('~/.undodir')
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile
endif

func! s:transparent_background()
    highlight Normal guibg=None ctermbg=None
    "highlight NonText guibg=None ctermbg=None
endf
autocmd ColorScheme * call s:transparent_background()

nnoremap <silent><nowait> <localleader>k  :Dox<cr><Esc>

noremap <silent><f1> :AsyncTask build<cr>
noremap <silent><f2> :AsyncTask run<cr>
