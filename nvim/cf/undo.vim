" 如果文件夹不存在，则新建文件夹
if !isdirectory($HOME.'/.nvim/files') && exists('*mkdir')
  call mkdir($HOME.'/.nvim/files')
endif

" 备份文件
set backup
set backupdir   =$HOME/.nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
" 交换文件
set directory   =$HOME/.nvim/files/swap//
set updatecount =100
" 撤销文件
set undofile
set undodir     =$HOME/.nvim/files/undo/
nnoremap <localleader>u :UndotreeToggle<cr>
