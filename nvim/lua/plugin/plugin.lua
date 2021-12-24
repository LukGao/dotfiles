
-- local plug_url_format = "https://hub.fastgit.org/%s"
local plug_url_format = "https://github.com/%s"

vim.cmd('packadd! packer.nvim')

local packer_config =  {
	auto_clean = false,
	git = {default_url_format = plug_url_format}
}

local plug_func = function()

	use{"dracula/vim",						as 		= "dracula"}
	use{"Yggdroot/LeaderF", 				run 	= ":LeaderfInstallCExtension"}
	use{"neoclide/coc.nvim", 				branch 	= "release"}
	use{"nvim-treesitter/nvim-treesitter", 	run 	= ":TSInstall"}
	use {
	  'nvim-lualine/lualine.nvim',
	   requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
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
	use{"luochen1990/rainbow"}
	use{"mg979/vim-visual-multi"}
	use{"scrooloose/nerdcommenter"}

	use{"bagrat/vim-buffet"}
	use{"yianwillis/vimcdoc"}
	use{"skywind3000/vim-cppman"}
	use{"lfv89/vim-interestingwords"}
	use{"MattesGroeger/vim-bookmarks"}
	use{"neomake/neomake"}
	use{"Chiel92/vim-autoformat"}
	use{"tpope/vim-abolish"}
	use{"skywind3000/asyncrun.vim"}
	use{"skywind3000/asynctasks.vim"}
	use{"github/copilot.vim"}
	use{"voldikss/vim-translator"}
end


return require("packer").startup({ 
	plug_func,    
	config = packer_config,

})
