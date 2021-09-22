
if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
	finish
endif

call quickui#menu#reset()
call quickui#menu#install("文件", [
			\ [ "打开\t(:w)", 'call feedkeys(":tabe ")'],
			\ [ "保存\t(:w)", 'write'],
			\ [ "--", ],
			\ [ "项目文件", 'call Fzf_dev()'],
			\ [ "最近打开", 'History'],
			\ [ "正在编辑", 'call quickui#tools#list_buffer("e")'],
			\ ])

call quickui#menu#install("文件", [
			\ [ "--", ],
			\ [ "退出", 'qa' ],
			\ ])

call quickui#menu#install('符号', [
            \ [ '定义', 'exec "normal \<Plug>(coc-definition)"'],
            \ [ '引用', 'exec "normal \<Plug>(coc-references)"'],
            \ [ '实现', 'exec "normal \<Plug>(coc-implementation)"'],
            \ [ '查找基类', 'call CocLocations("ccls","$ccls/inheritance")'],
            \ [ '查找子类', 'call CocLocations("ccls","$ccls/inheritance",{"derived":v:true})'],
            \ [ '查看调用者', 'call CocLocations("ccls","$ccls/call")'],
            \ [ '查看被调用者', 'call CocLocations("ccls","$ccls/call",{"callee":v:true})'],
            \ [ '成员变量', 'call CocLocations("ccls","$ccls/member")'],
            \ [ '成员函数', 'call CocLocations("ccls","$ccls/member",{"kind":3})'],
            \ ])

"----------------------------------------------------------------------
" hotkey
"----------------------------------------------------------------------
noremap <leader><space> :call quickui#menu#open()<cr>


function! s:fzf_sink(what)
	let p1 = stridx(a:what, '<')
	if p1 >= 0
		let name = strpart(a:what, 0, p1)
		let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
		if name != ''
			exec "AsyncTask ". fnameescape(name)
		endif
	endif
endfunction

function! s:fzf_task()
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	let opts = { 'source': source, 'sink': function('s:fzf_sink'),
				\ 'options': '+m --nth 1 --inline-info --tac' }
	if exists('g:fzf_layout')
		for key in keys(g:fzf_layout)
			let opts[key] = deepcopy(g:fzf_layout[key])
		endfor
	endif
	call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()
let g:asyncrun_open = 8
let g:asynctasks_term_pos = 'vim'
noremap <silent><localleader>t :AsyncTaskFzf <cr>
