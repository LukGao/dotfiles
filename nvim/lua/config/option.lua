vim.g.mapleader=','
vim.g.maplocalleader=';'
vim.opt.termguicolors=true
vim.opt.number=true
vim.opt.showcmd=true
-- vim.opt.cursorline=true
vim.opt.ttimeoutlen=0
vim.opt.laststatus=2
vim.opt.showtabline=2
vim.opt.showmode=false
vim.opt.autochdir=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.smarttab=true
vim.opt.expandtab=true
vim.opt.wrap=false
vim.opt.sidescroll=10
vim.opt.colorcolumn='100'
vim.opt.hidden=true
vim.opt.shortmess='aFc'
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.autowrite=true
vim.opt.confirm=true
vim.opt.langmenu='zh_CN.UTF-8'
vim.opt.fillchars = "vert:│"
vim.opt.virtualedit={'block','onemore'}
vim.opt.helplang='cn'
vim.opt.encoding='utf8'
vim.opt.updatecount=100
vim.opt.undofile=true
vim.opt.completeopt = "menu,menuone,noselect"

vim.cmd[[
    set wildignore+=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
    set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
    set wildignore+=*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
    set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
    set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
    set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
    set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
    set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
    set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
    set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*
]]


vim.opt.fileencodings='utf8,ucs-bom,gbk,cp936,gb2312,gb18030'
vim.opt.fileencoding='utf-8'

vim.cmd[[
    let g:python_host_prog = '/user/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
]]