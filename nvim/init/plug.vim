call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yianwillis/vimcdoc'
Plug 'skywind3000/vim-cppman'           " cppreferences 文档
Plug 'bagrat/vim-buffet'                " buffer切换
Plug 'hardcoreplayers/spaceline.vim'    " 状态栏
Plug 'mhinz/vim-startify'               " 启动页
Plug 'fatih/vim-go'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ryanoasis/vim-devicons'           " icon
Plug 'MattesGroeger/vim-bookmarks'      " 书签
Plug 'voldikss/vim-translator'           " 翻译
Plug 'preservim/nerdtree'               " 目录树
Plug 'mbbill/undotree'                  " 后悔药
Plug 'mg979/vim-visual-multi'           " 多行编辑
Plug 'luochen1990/rainbow'              " 多彩括号
Plug 'lfv89/vim-interestingwords'       " 单词标记
Plug 'neomake/neomake'                  " 语法检查
Plug 'Chiel92/vim-autoformat' ,         {'for':['c','cpp','cc']}
Plug 'majutsushi/tagbar',               { 'on':'TagbarToggle'}
Plug 'neoclide/coc.nvim',               {'branch': 'release'}
Plug 'tpope/vim-endwise',               {'for':['c','cpp','cc']}                            " endif补全
Plug 'honza/vim-snippets',              {'for':['go','c','cpp','cc','py']}                  " 代码片段
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter',        {'for':['go','c','cpp','cc','py']}                  " 注释插件
Plug 'tpope/vim-abolish'             ,  {'for':['go','c','cpp','cc','py']}                  " 命名风格转换
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function',       { 'for':['c', 'cpp','cc','go','py'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'dracula/vim',                     { 'as': 'dracula' } " 主题
Plug 'skywind3000/vim-quickui'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

