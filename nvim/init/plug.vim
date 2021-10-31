call plug#begin('~/.nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'

Plug 'tpope/vim-endwise'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'scrooloose/nerdcommenter'

Plug 'mbbill/undotree'
Plug 'bagrat/vim-buffet'
Plug 'yianwillis/vimcdoc'
Plug 'skywind3000/vim-cppman'
Plug 'lfv89/vim-interestingwords'
Plug 'MattesGroeger/vim-bookmarks'


Plug 'neomake/neomake'
Plug 'Chiel92/vim-autoformat'

Plug 'tpope/vim-abolish'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'fatih/vim-go'

Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim',               {'branch': 'release'}
Plug 'voldikss/vim-translator'
Plug 'dracula/vim',                     { 'as': 'dracula' }
Plug 'glepnir/galaxyline.nvim',         {'branch': 'main'}

Plug 'skywind3000/vim-quickui'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'github/copilot.vim'
call plug#end()
