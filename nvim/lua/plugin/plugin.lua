local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local cppman_cfg = function() vim.cmd [[ autocmd FileType c,cpp setlocal keywordprg=:Cppman ]] end

local leaderf_cfg = function()
    vim.g.Lf_GtagsAutoGenerate = 1
    vim.g.Lf_Gtagslabel = 'native-pygments'
    vim.g.Lf_UseCache = 0
    vim.g.Lf_HideHelp = 1
    vim.g.Lf_MruMaxFiles = 2048
    vim.g.Lf_WindowHeight = 0.30
    vim.g.Lf_UseMemoryCache = 0
    vim.g.Lf_ShowRelativePath = 0
    vim.g.Lf_UseVersionControlTool = 0
    vim.g.Lf_IgnoreCurrentBufferName = 1
    vim.g.Lf_PreviewResult = { Function = 0, BufTag = 0 }
    vim.g.Lf_StlSeparator = { left = '', right = '', font = '' }
    vim.g.Lf_WildIgnore = {
        dir = { '.git', '.clangd', '.svn', '.hg', '.cache', '.build', '.deps', '.ccls-cache', 'build' },
        file = { '*.exe', '*.o', '*.a', '*.so', '*.py[co]', '*.sw?', '*.bak', '*.d', '*.idx', "*.lint", '*.gcno' }
    }
    vim.g.Lf_WorkingDirectoryMode = 'AF'
    vim.g.Lf_RootMarkers = { '.git', '.svn', '.hg', '.project', '.root' }
    vim.g.Lf_NormalMap = {
        File = { { "<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>' } },
        Buffer = { { "<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>' } },
        Mru = { { "<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>' } },
        Tag = { { "<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>' } },
        Function = { { "<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>' } },
        Colorscheme = { { "<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>' } },
    }
    vim.cmd [[
    nnoremap <silent> <space>f :LeaderfFunction<cr>
    nnoremap <silent> <localleader>m :LeaderfMru<cr>
    ]]
end
local interestingwords_cfg = function()
    vim.g.interestingWordsGUIColors = {
        '#72b5e4', '#f0c53f', '#ff8784', '#c5c7f1',
        '#c2d735', '#78d3cc', '#ea8336', '#e43542',
        '#ebab35', '#ebe735', '#aadd32', '#219286',
        '#2f569c', '#ffb577', '#5282a4', '#edfccf',
        '#67064c', '#f5bca7', '#95c474', '#dece83',
        '#de9783', '#f2e700', '#e9e9e9', '#69636d',
        '#626b98', '#f5f5a7', '#dcca6b', '#b72a83',
        '#6f2b9d', '#5f569c',
    }
end

local buffet_cfg = function()
    vim.cmd [[
    nmap <leader>1 <Plug>BuffetSwitch(1)
    nmap <leader>2 <Plug>BuffetSwitch(2)
    nmap <leader>3 <Plug>BuffetSwitch(3)
    nmap <leader>4 <Plug>BuffetSwitch(4)
    nmap <leader>5 <Plug>BuffetSwitch(5)
    nmap <leader>6 <Plug>BuffetSwitch(6)
    nmap <leader>7 <Plug>BuffetSwitch(7)
    nmap <leader>8 <Plug>BuffetSwitch(8)
    nmap <leader>9 <Plug>BuffetSwitch(9)
    nmap <leader>0 <Plug>BuffetSwitch(10)

    let g:buffet_tab_icon = "\uf00a"
    let g:buffet_tab_icon = "\uf00a"
    let g:buffet_show_index = 1
    let g:buffet_powerline_separators = 1
    let g:buffet_left_trunc_icon = "\uf0a8"
    let g:buffet_right_trunc_icon = "\uf0a9"

    function! g:BuffetSetCustomColors()
        hi! BuffetCurrentBuffer cterm=NONE ctermbg=106 ctermfg=8 guibg=#b8bb26 guifg=#000000
        hi! BuffetTrunc cterm=bold ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
        hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
        hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
        hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#999999 guifg=#504945
    endfunction
    ]]

end

local tagbar_cfg = function()
    vim.cmd [[
    let g:tagbar_width=25
    nnoremap <localleader>g :TagbarToggle<CR>
    ]]
end

local asynctasks_cfg = function()
    vim.g.asyncrun_open = 15
    vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg' }
end

local fzf_cfg = function()
    vim.cmd [[
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
    ]]
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyDone',
    once = true,
    callback = function()
        vim.cmd [[
            silent! colorscheme dracula
        ]]
    end,
})

local line_cfg = function()
    local dracula = require 'lualine.themes.dracula'
    require('lualine').setup {
        options = {
            theme                = dracula,
            section_separators   = { left = ' ', right = ' ' },
            component_separators = { right = ' ', left = ' ' },
        },
        sections = {
            lualine_c = { 'g:coc_status' },
            lualine_x = {
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#ff9e64" },
                },
            },
        },
    }
end

local rainbow_cfg = function() vim.g.rainbow_active = 1 end

local shade_cfg = function()
    require 'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
            brightness_up   = '<C-Up>',
            brightness_down = '<C-Down>',
            toggle          = '<Leader>s',
        }
    })
end
local startify_cfg = function()
    vim.g.startify_padding_left = 30
    vim.g.better_whitespace_enabled = 0
    vim.g.strip_whitespace_confirm = 0
end
local translate_cfg = function()
    --vim.g.translator_proxy_url = 'socks5://172.20.50.241:1080'
    vim.g.translator_default_engines = { 'youdao', 'bing' }
    vim.cmd [[
        nmap <silent> <leader>t <Plug>TranslateW
        vmap <silent> <leader>t <Plug>TranslateWV
    ]]
end
local opts = {
    defaults = {
        lazy = true
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'rplugin',
                'gzip',
                'matchit',
                'matchparen',
                'shada',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
}
require("lazy").setup({
    spec = {

        { "kyazdani42/nvim-web-devicons", event = 'VeryLazy', },
        { "tpope/vim-endwise", event = 'VeryLazy', },
        { "scrooloose/nerdcommenter", event = 'VeryLazy', },
        { "vim-scripts/DoxygenToolkit.vim", event = 'VeryLazy', },
        { "MattesGroeger/vim-bookmarks", event = 'VeryLazy', },
        { "tpope/vim-abolish", event = 'VeryLazy', },
        { "skywind3000/asyncrun.vim", event = 'VeryLazy', },
        { "mbbill/undotree", event = 'VeryLazy', },
        { "rcarriga/nvim-notify", event = 'VeryLazy', },
        { "junegunn/fzf.vim", event = 'VeryLazy', },
        { "m-pilia/vim-ccls", event = 'VeryLazy', },
        { "skywind3000/vim-terminal-help", event = 'VeryLazy', },
        { "mg979/vim-visual-multi", event = 'VeryLazy', },
        { "voldikss/vim-translator", config = translate_cfg, event = 'VeryLazy', },
        { "antoinemadec/coc-fzf", config = fzf_cfg, event = 'VeryLazy', },
        { "mhinz/vim-startify", config = startify_cfg },
        { "nvim-lualine/lualine.nvim", config = line_cfg, event = 'VeryLazy', },
        { "sunjon/shade.nvim", config = shade_cfg, event = 'VeryLazy', },
        { 'yuki-yano/fzf-preview.vim', branch = 'release/rpc', event = 'VeryLazy', },
        { "junegunn/fzf", dir = "~/.fzf", build = "./install --all", event = 'VeryLazy', },
        { "neoclide/coc.nvim", branch = "release", event = 'VeryLazy', },
        { "preservim/tagbar", config = tagbar_cfg, event = 'VeryLazy', },
        { "bagrat/vim-buffet", config = buffet_cfg, event = "VeryLazy", },
        { "luochen1990/rainbow", config = rainbow_cfg, event = 'VeryLazy', },
        { "skywind3000/asynctasks.vim", config = asynctasks_cfg, event = 'VeryLazy', },
        { "lfv89/vim-interestingwords", config = interestingwords_cfg, event = 'VeryLazy', },
        { "skywind3000/vim-cppman", config = cppman_cfg, event = 'VeryLazy', },
        { "dracula/vim", name = "dracula", },
        { "Yggdroot/LeaderF", build = ":LeaderfInstallCExtension", config = leaderf_cfg, event = 'VeryLazy', },
    },
    opts
})
