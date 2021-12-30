-- local plug_url_format = "https://hub.fastgit.org/%s"
-- local packer_url = "https://hub.fastgit.org/wbthomason/packer.nvim"

local plug_url_format = "https://github.com/%s"
local packer_url = "https://github.com/wbthomason/packer.nvim"

local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", packer_url, install_path})
end



vim.cmd("packadd! packer.nvim")

local packer_config =  {
    auto_clean = false,
    git = { default_url_format = plug_url_format}
}

local plug_func = function()
    use{"nvim-lua/plenary.nvim"}
    use{"wbthomason/packer.nvim"}
    use{"dracula/vim", as = "dracula",config = function() vim.cmd[[silent! colorscheme dracula]] end}
    use{"Yggdroot/LeaderF", run = ":LeaderfInstallCExtension"}
    use{"kyazdani42/nvim-web-devicons"}
    use{"nvim-lualine/lualine.nvim", config = require("plugin.lualine")}
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
    use{"nvim-treesitter/nvim-treesitter", config = require("plugin.treesitter")}
    use{"phaazon/hop.nvim", as = "hop", config = function() require("hop").setup({
        keys = 'etovxqpdygfblzhckisuran', 
        jump_on_sole_occurrence = false,
        vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {}),
        vim.api.nvim_set_keymap('n', 'e', ":HopWordCurrentLine<CR>", {}),
        vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {}),
        vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {}),
        vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {}),
        vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {}),
        vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {}),
    }) end}
    
    use{"neoclide/coc.nvim", branch  = "release", config = function ()
        vim.g.coc_global_extensions ={'coc-clangd','coc-snippets','coc-cmake','coc-pairs','coc-json','coc-highlight','coc-emoji','coc-lists','coc-yaml', 'coc-translator' ,'coc-explorer'}
        vim.api.nvim_command([[
          nmap <leader>rn <Plug>(coc-rename)
          nmap <space>e <Cmd>CocCommand explorer --position floating<CR>
          autocmd FileType coc-explorer setlocal norelativenumber
          autocmd BufEnter coc-explorer if &ft == 'coc-explorer'| call CocAction('runCommand', 'explorer.doAction', 'closest', ['refresh']) | endif
        ]])
    end}

    use{"neomake/neomake", config = function ()
        vim.g.neomake_tempfile_dir = '~/.nvim/tmp/neomake'
        vim.g.neomake_cpp_enable_makers = 'clang'
        vim.g.neomake_cpp_clang_maker = {exe = 'clang' }
        vim.g.neomake_cpp_clang_args = {'--std=c++20','--analyze -extra-arg -Xanalyzer -extra-arg -analyzer-output=text'}

        vim.cmd[[
            silent! call neomake#configure#automake('w')
        ]]
    end}


    use{"xiyaowong/nvim-bqf", ft = "qf",config = function() require("bqf").setup({
         vim.cmd[[
            augroup BQF
               au!
               au FileType qf nnoremap <silent> <esc> :cclose<CR>
             augroup END
         ]]

    }) end}
    use{"bagrat/vim-buffet"}
    use{"skywind3000/vim-cppman"}
    use{"lfv89/vim-interestingwords"}
    use{"MattesGroeger/vim-bookmarks"}
    use{"tpope/vim-abolish"}
    use{"skywind3000/asyncrun.vim"}
    use{"skywind3000/asynctasks.vim"}
    use{"github/copilot.vim",config = function()
        vim.cmd[[
            let g:copilot_no_tab_map = v:true
            imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        ]]
    end}
    use{"voldikss/vim-translator"}
    use{"p00f/nvim-ts-rainbow"}
    use{"jiangmiao/auto-pairs"}
    if packer_bootstrap then
        require("packer").sync()
    end
end


return require("packer").startup({ 
    plug_func,
    config = packer_config,
})
