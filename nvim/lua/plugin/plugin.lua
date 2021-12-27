-- local plug_url_format = "https://hub.fastgit.org/%s"
-- local packer_url = "https://hub.fastgit.org/wbthomason/packer.nvim"

local plug_url_format = "https://github.com/%s"
local packer_url = "https://github.com/wbthomason/packer.nvim"

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
end



vim.cmd("packadd! packer.nvim")

local packer_config =  {
    auto_clean = false,
    git = { default_url_format = plug_url_format}
}

local plug_func = function()
    use{"nvim-lua/plenary.nvim"}
    use{"wbthomason/packer.nvim"}
    use{"dracula/vim",                      as      = "dracula",config = function() vim.cmd[[silent! colorscheme dracula]] end}
    use{"Yggdroot/LeaderF",                 run     = ":LeaderfInstallCExtension"}
    use{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require("plugin.treesitter")}
    use{"kyazdani42/nvim-web-devicons"}
    use{"nvim-lualine/lualine.nvim", config = require("plugin.lualine")}
    use{"mfussenegger/nvim-lint"}
    use{"preservim/tagbar"}
    use{"rcarriga/nvim-notify"}
    use{"ryanoasis/vim-devicons"}
    use{"mhinz/vim-startify"}
    use{"kana/vim-textobj-user"}
    use{"kana/vim-textobj-indent"}
    use{"kana/vim-textobj-syntax"}
    use{"kana/vim-textobj-function"}
    use{"sgur/vim-textobj-parameter"}
    use{"tpope/vim-endwise"}
    use{"honza/vim-snippets"}
    use{"tpope/vim-surround"}
    use{"mg979/vim-visual-multi"}
    use{"scrooloose/nerdcommenter"}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'andymass/vim-matchup'}
    use {'phaazon/hop.nvim', as = 'hop', config = function() require('hop').setup() end}
    use {'folke/trouble.nvim', config = function() require('trouble').setup() end}
    use {'xiyaowong/nvim-bqf', ft = 'qf',config = function() require('bqf').setup({
    	vim.cmd[[
    	augroup BQF
			  au!
			  au FileType qf nnoremap <silent> <esc> :cclose<CR>
			augroup END
    	]]

    }) end}
    use {'junegunn/fzf'}
    use {"folke/twilight.nvim",config = function()require("twilight").setup()end}
    use {"folke/zen-mode.nvim",config = function()  require("zen-mode").setup()end}
	  use{"bagrat/vim-buffet"}
    use{"skywind3000/vim-cppman"}
    use{"lfv89/vim-interestingwords"}
    use{"MattesGroeger/vim-bookmarks"}
    use{"neomake/neomake"}
    use{"tpope/vim-abolish"}
    use{"skywind3000/asyncrun.vim"}
    use{"skywind3000/asynctasks.vim"}
    use{"github/copilot.vim"}
    use{"voldikss/vim-translator"}
    use{"folke/lsp-colors.nvim"}
    use{"p00f/nvim-ts-rainbow"}
    use{"jiangmiao/auto-pairs"}
    use{"rafamadriz/friendly-snippets"}
    use{"hrsh7th/vim-vsnip"}
    use{"hrsh7th/vim-vsnip-integ"}
    use{"hrsh7th/cmp-vsnip"}
    use{"hrsh7th/cmp-buffer"}
    use{"hrsh7th/cmp-nvim-lsp"}
    use{"hrsh7th/cmp-path"}
    use{"hrsh7th/cmp-cmdline"}
    use{"octaltree/cmp-look"}
    use{"hrsh7th/nvim-cmp", config = require("plugin.cmp")}
    use{"neovim/nvim-lspconfig"}
    use{"williamboman/nvim-lsp-installer", config = function() require("lsp").setup() end}
    use{"ray-x/lsp_signature.nvim", config = require("plugin.lsp_signature")}
    if packer_bootstrap then
        require('packer').sync()
    end
end


return require("packer").startup({ 
    plug_func,
    config = packer_config,
})
