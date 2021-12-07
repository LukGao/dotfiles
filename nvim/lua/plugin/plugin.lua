
vim.g.package_home = vim.fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local plug_url_format = "https://hub.fastgit.org/%s"
local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("split | term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

if vim.fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require('packer').startup({
  function(use)
    use({"wbthomason/packer.nvim", opt = true})
    use({'dracula/vim', as = 'dracula'})
    use({ "Yggdroot/LeaderF", run = ":LeaderfInstallCExtension" })
    use({ "neoclide/coc.nvim", branch = "release" })

    use("rcarriga/nvim-notify")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")

    use( "mhinz/vim-startify")
    use( "kana/vim-textobj-user")
    use( "kana/vim-textobj-indent")
    use( "kana/vim-textobj-syntax")
    use( "kana/vim-textobj-function")
    use( "sgur/vim-textobj-parameter")

    use( "tpope/vim-endwise")
    use( "honza/vim-snippets")
    use( "tpope/vim-surround")
    use( "luochen1990/rainbow")
    use( "mg979/vim-visual-multi")
    use( "scrooloose/nerdcommenter")

    use( "bagrat/vim-buffet")
    use( "yianwillis/vimcdoc")
    use( "skywind3000/vim-cppman")
    use( "lfv89/vim-interestingwords")
    use( "MattesGroeger/vim-bookmarks")
    use( "neomake/neomake")
    use( "Chiel92/vim-autoformat")
    use( "tpope/vim-abolish")
    use( "skywind3000/asyncrun.vim")
    use( "skywind3000/asynctasks.vim")
    use( "github/copilot.vim")
    use( "voldikss/vim-translator")
    use("nvim-treesitter/nvim-treesitter")
    use("preservim/tagbar")
    use({"glepnir/galaxyline.nvim", branch = "main" })

  end,
  config={
    max_jobs = 16,
  	git={default_url_format = plug_url_format}
  }
})




