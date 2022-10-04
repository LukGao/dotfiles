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
        let g:Lf_WorkingDirectoryMode = 'AF'
        let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
        nnoremap <silent> <localleader>f :LeaderfFunction<cr>
        nnoremap <silent> <localleader>m :LeaderfMru<cr>
        ]]
    end}
    use{"kyazdani42/nvim-web-devicons"}
    use{"preservim/tagbar"}
    use{"rcarriga/nvim-notify"}
    use{"ryanoasis/vim-devicons", config = function ()
        require("notify").setup({
            background_colour = "#000000",
        })
    end}
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
    use{"tpope/vim-surround"}
    use{"mg979/vim-visual-multi"}
    use{"scrooloose/nerdcommenter"}
    use{"nvim-treesitter/nvim-treesitter", config = require("plugin.treesitter")}
    use{"neoclide/coc.nvim", branch  = "release"}

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
    use{"vim-scripts/DoxygenToolkit.vim"}
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
        vim.g.asyncrun_rootmarks = {'.git', '.svn', '.root', '.project', '.hg'}
    end}
    use{"Chiel92/vim-autoformat", config = function ()
        vim.cmd[[
        nnoremap <localleader>ft :Autoformat<CR>
        ]]

    end}

    use{"ooknn/translate", config = function ()
        vim.cmd[[
        vmap <silent> <leader>t <Cmd>lua require("translate").translateV()<cr>
        nmap <silent> <leader>t <Cmd>lua require("translate").translateN()<cr>

        command! Translate  lua require("translate").translateN()
        command! TranslateV lua require("translate").translateV()
        ]]
    end}

    use{"luochen1990/rainbow", config = function ()
        vim.cmd[[
        let g:rainbow_active = 1
        ]]
    end}

    use {'karb94/neoscroll.nvim',config = function()
        require('neoscroll').setup({
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,       -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        })
    end}

    use{"mbbill/undotree"}

    use{"mfussenegger/nvim-dap",config = require ("plugin.dap")}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use{"Shatur/neovim-cmake",config = require ("plugin.cmake")}

    use{"theHamsta/nvim-dap-virtual-text",config = function()
        require("nvim-dap-virtual-text").setup {
            enabled = true,                        -- enable this plugin (the default)
            enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,               -- show stop reason when stopped for exceptions
            commented = false,                     -- prefix virtual text with comment string
            only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
            all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
            filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
            -- experimental features:
            virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
            all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        }
    end}
    use {"skywind3000/vim-terminal-help"}
    if packer_bootstrap then
        require("packer").sync()
    end
end


return require("packer").startup({
    plug_func,
    config = packer_config,
})
