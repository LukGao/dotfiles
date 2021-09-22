" 如果文件夹不存在，则新建文件夹
if !isdirectory($HOME.'/.nvim/files') && exists('*mkdir')
  call mkdir($HOME.'/.nvim/files')
endif

set directory   =$HOME/.nvim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.nvim/files/undo/
set viminfo     ='100,n$HOME/.nvim/files/info/viminfo
