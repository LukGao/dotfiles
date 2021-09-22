if has("persistent_undo")
  set undodir=~/.vim/.undodir/
  set undofile
endif
nnoremap <localleader>u :UndotreeToggle<cr>
