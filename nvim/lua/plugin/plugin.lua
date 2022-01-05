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
    use{"Yggdroot/LeaderF", run = ":LeaderfInstallCExtension", config = function ()
        vim.g.Lf_UseCache = 0
        vim.g.Lf_HideHelp = 1
        vim.g.Lf_MruMaxFiles = 2048
        vim.g.Lf_WindowHeight = 0.30
        vim.g.Lf_UseMemoryCache = 0
        vim.g.Lf_ShowRelativePath = 0
        vim.g.Lf_UseVersionControlTool = 0
        vim.g.Lf_IgnoreCurrentBufferName = 1
        vim.g.Lf_PreviewResult = {Function = 0, BufTag= 0 }
        vim.g.Lf_StlSeparator = { left = '', right= '', font='' }

        vim.g.Lf_WildIgnore = {
              dir = {'.git','.clangd', '.svn', '.hg', '.cache', '.build', '.deps', '.ccls-cache', 'build'},
              file = {'*.exe', '*.o', '*.a', '*.so', '*.py[co]', '*.sw?', '*.bak', '*.d', '*.idx', "*.lint", '*.gcno'}
        }

        vim.cmd[[
            nnoremap <silent><nowait> <c-f> :LeaderfFunction<cr>
            nnoremap <silent><nowait> <localleader>m :LeaderfMru<cr>
        ]]
    end}
    use{"kyazdani42/nvim-web-devicons"}
    use{"nvim-lualine/lualine.nvim", config = require("plugin.lualine")}
    use{"preservim/tagbar"}
    use{"rcarriga/nvim-notify"}
    use{"ryanoasis/vim-devicons"}
    use{"mhinz/vim-startify", config = function ()
        vim.g.startify_padding_left = 30    
        vim.g.better_whitespace_enabled=0   
        vim.g.strip_whitespace_confirm=0
    end}
    use{"kana/vim-textobj-user"}
    use{"kana/vim-textobj-indent"}
    use{"kana/vim-textobj-syntax"}
    use{"kana/vim-textobj-function"}
    use{"sgur/vim-textobj-parameter"}
    use{"tpope/vim-endwise"}
    use{"honza/vim-snippets", event = "VimEnter"}
    use{"tpope/vim-surround"}
    use{"mg979/vim-visual-multi"}
    use{"scrooloose/nerdcommenter"}
    use{"nvim-treesitter/nvim-treesitter", config = require("plugin.treesitter")}
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
         require("indent_blankline").setup {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
            use_treesitter = true,
            context_patterns = {
                "class", "function", "method", "block", "list_literal", "selector",
                "^if", "^table", "if_statement", "while", "for",
            },
            filetype_exclude = { "help", "coc-explorer", "terminal", "packer", 'startify', 'fzf', 'tagbar'},
            buftype_exclude = { "help", "coc-explorer", "terminal", "packer", 'startify', 'fzf', 'tagbar'},
         }
      end
   }
    use{"neoclide/coc.nvim", branch  = "release", config = function ()
        vim.g.coc_global_extensions ={'coc-clangd','coc-snippets','coc-cmake','coc-pairs','coc-json','coc-highlight','coc-emoji','coc-lists','coc-yaml','coc-explorer'}
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
    use{"m-pilia/vim-ccls", config = function ()
        vim.g.ccls_close_on_jump = true
        vim.g.yggdrasil_no_default_maps = 1
    end}
    use{"junegunn/fzf"}
    use{"junegunn/fzf.vim"}
    use{"antoinemadec/coc-fzf", config = function ()
        vim.cmd[[
            let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
        ]]
    end}

    use{"bagrat/vim-buffet"}
    use{"skywind3000/vim-cppman", config = function ()
        vim.cmd[[
            autocmd FileType c,cpp setlocal keywordprg=:Cppman
        ]]
    end}
    use{"lfv89/vim-interestingwords"}
    use{"MattesGroeger/vim-bookmarks"}
    use{"tpope/vim-abolish"}
    use{"skywind3000/asyncrun.vim"}
    use{"skywind3000/asynctasks.vim", config = function ()
        vim.g.asyncrun_open = 15
    end}
    use{"github/copilot.vim", config = function ()
        vim.cmd[[
            let g:copilot_no_tab_map = v:true
            imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        ]]
    end}
    use{"Chiel92/vim-autoformat", config = function ()
        vim.cmd[[
            nnoremap <localleader>ft :Autoformat<CR>
        ]]

    end}

    use{"voldikss/vim-translator", config = function ()
        vim.cmd[[
            nmap <silent> <Leader>w <Plug>TranslateW
            vmap <silent> <Leader>w <Plug>TranslateWV
        ]]
    end}
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
