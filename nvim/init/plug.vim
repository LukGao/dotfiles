call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yianwillis/vimcdoc'
Plug 'skywind3000/vim-cppman'
Plug 'bagrat/vim-buffet'

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'mhinz/vim-startify'
Plug 'fatih/vim-go'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ryanoasis/vim-devicons'         
Plug 'MattesGroeger/vim-bookmarks'    
Plug 'mbbill/undotree'                
Plug 'mg979/vim-visual-multi'         
Plug 'luochen1990/rainbow'            
Plug 'lfv89/vim-interestingwords'     
Plug 'neomake/neomake'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar',               { 'on':'TagbarToggle'}
Plug 'neoclide/coc.nvim',               {'branch': 'release'}
Plug 'tpope/vim-endwise',               {'for':['c','cpp','cc']}            
Plug 'honza/vim-snippets',              {'for':['go','c','cpp','cc','py']}  
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter',        {'for':['go','c','cpp','cc','py']}  
Plug 'tpope/vim-abolish'    
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function',       { 'for':['c', 'cpp','cc','go','py'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'dracula/vim',                     { 'as': 'dracula' }
Plug 'skywind3000/vim-quickui'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-translator'
call plug#end()
