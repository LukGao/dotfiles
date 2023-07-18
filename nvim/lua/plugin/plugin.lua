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
    vim.g.Lf_GtagsAutoGenerate       = 1
    vim.g.Lf_Gtagslabel              = "native-pygments"
    vim.g.Lf_UseCache                = 0
    vim.g.Lf_HideHelp                = 1
    vim.g.Lf_MruMaxFiles             = 2048
    vim.g.Lf_WindowHeight            = 0.30
    vim.g.Lf_UseMemoryCache          = 0
    vim.g.Lf_ShowRelativePath        = 0
    vim.g.Lf_UseVersionControlTool   = 0
    vim.g.Lf_IgnoreCurrentBufferName = 1
    vim.g.Lf_WindowPosition          = 'bottom'
    vim.g.Lf_PopupShowStatusline     = 0
    vim.g.Lf_PopupShowBorder         = 0
    vim.g.Lf_PopupWidth              = 0.8
    vim.g.Lf_PopupPosition           = { 0, 0 }
    vim.g.Lf_StlSeparator            = { left = "", right = "" }
    vim.g.Lf_PopupPreviewPosition    = 'top'
    vim.g.Lf_PreviewResult           = {
        File = 0,
        Mru = 0,
        Tag = 0,
        Function = 0,
        BufTag = 0,
        Colorscheme = 0,
        Line = 0,
        Rg = 0
    }
    vim.g.Lf_WildIgnore              = {
        dir = { ".git", ".clangd", ".svn", ".hg", ".cache", ".build", ".deps", ".ccls-cache", "build" },
        file = { "*.exe", "*.o", "*.a", "*.so", "*.py[co]", "*.sw?", "*.bak", "*.d", "*.idx", "*.lint", "*.gcno" },
    }
    vim.g.Lf_WorkingDirectoryMode    = "AF"
    vim.g.Lf_RootMarkers             = { ".git", ".svn", ".hg", ".project", ".root" }
    vim.g.Lf_NormalMap               = {
        File = { { "<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>' } },
        Buffer = { { "<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>' } },
        Mru = { { "<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>' } },
        Tag = { { "<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>' } },
        Function = { { "<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>' } },
        Colorscheme = { { "<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>' } },
    }
    vim.cmd [[
        nnoremap <silent><nowait> <localleader>f :LeaderfFunction<cr>
        nnoremap <silent><nowait> <localleader>m :LeaderfMru<cr>
        nnoremap <silent><nowait> <C-p> :LeaderfFile<cr>
        nnoremap <silent><nowait> <leader>fh :LeaderfHelp<cr>
        nnoremap <silent><nowait> <leader>fl :LeaderfLine<cr>
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
    vim.opt.termguicolors = true
    local colors = {
        white = "#abb2bf",
        darker_black = "#1b1f27",
        black = "#1e222a",  --  nvim bg
        black2 = "#252931",
        one_bg = "#282c34", -- real bg of onedark
        one_bg2 = "#353b45",
        one_bg3 = "#30343c",
        grey = "#42464e",
        grey_fg = "#565c64",
        grey_fg2 = "#6f737b",
        light_grey = "#6f737b",
        red = "#d47d85",
        baby_pink = "#DE8C92",
        pink = "#ff75a0",
        line = "#2a2e36", -- for lines like vertsplit
        green = "#A3BE8C",
        vibrant_green = "#7eca9c",
        nord_blue = "#81A1C1",
        blue = "#61afef",
        yellow = "#e7c787",
        sun = "#EBCB8B",
        purple = "#b4bbc8",
        dark_purple = "#c882e7",
        teal = "#519ABA",
        orange = "#fca2aa",
        cyan = "#a3b8ef",
        statusline_bg = "#22262e",
        lightbg = "#2d3139",
        lightbg2 = "#262a32",
        pmenu_bg = "#A3BE8C",
        folder_bg = "#61afef",
    }

    require('bufferline').setup {
        options = {
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "vertical sbuffer %d",
            left_mouse_command = function(buf_id)
                local win_ids = vim.fn.win_findbuf(buf_id)
                if win_ids[1] then
                    vim.fn.win_gotoid(win_ids[1])
                else
                    vim.cmd(string.format("tabe %s", vim.api.nvim_buf_get_name(buf_id)))
                    -- vim.cmd(string.format("vertical sbuffer %d", buf_id))
                end
            end,
            middle_mouse_command = nil,
            indicator = {
                icon = '▎',
                style = 'icon',
            },
            buffer_close_icon = ' ',
            modified_icon = ' ',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 20,
            max_prefix_length = 15,
            tab_size = 15,
            diagnostics = false,
            offsets = { { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory' } },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = 'thin',
            enforce_regular_tabs = false,
            always_show_bufferline = false,
            sort_by = "tabs",
        },
        highlights = {
            background = {
                fg = colors.grey_fg,
                bg = colors.black2,
            },
            -- buffers
            buffer_selected = {
                fg = colors.white,
                bg = colors.black,
                bold = true,
                italic = false,
            },
            buffer_visible = {
                fg = colors.light_grey,
                bg = colors.black2,
            },
            -- close buttons
            close_button = {
                fg = colors.light_grey,
                bg = colors.black2,
            },
            close_button_visible = {
                fg = colors.light_grey,
                bg = colors.black2,
            },
            close_button_selected = {
                fg = colors.light_grey,
                bg = colors.black,
            },
            fill = {
                fg = colors.grey_fg,
                bg = colors.black2,
            },
            indicator_selected = {
                fg = colors.blue,
                bg = colors.black,
            },
            -- modified
            modified = {
                fg = colors.red,
                bg = colors.black2,
            },
            modified_visible = {
                fg = colors.red,
                bg = colors.black2,
            },
            modified_selected = {
                fg = colors.green,
                bg = colors.black,
            },
            -- separators
            separator = {
                fg = colors.black2,
                bg = colors.black2,
            },
            separator_visible = {
                fg = colors.black2,
                bg = colors.black2,
            },
            separator_selected = {
                fg = colors.black2,
                bg = colors.black2,
            },
            -- tabs
            tab = {
                fg = colors.light_grey,
                bg = colors.one_bg3,
            },
            tab_selected = {
                fg = colors.black2,
                bg = colors.nord_blue,
            },
            tab_close = {
                fg = colors.light_grey,
                bg = colors.black,
            },
        }
    }
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
function _G.symbol_line()
    local curwin = vim.g.statusline_winid or 0
    local curbuf = vim.api.nvim_win_get_buf(curwin)
    local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
    return ok and line or ''
end

local line_cfg = function()
    local dracula = require 'lualine.themes.dracula'
    require('lualine').setup {
        options = {
            theme                = 'auto',
            section_separators   = { left = ' ', right = ' ' },
            component_separators = { right = ' ', left = ' ' },
            disabled_filetypes   = { 'coc-explorer', 'tagbar', },
            always_divide_middle = true,
            globalstatus         = false,
        },
        sections = {
            lualine_c = { 'filetype' },
            lualine_x = {
                'symbol_line()'
            },
            lualine_y = { 'encoding', 'fileformat', 'progress' },
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
    vim.cmd [[
        vmap <silent> <leader>t <Cmd>lua require("translate").translateV()<cr>
        nmap <silent> <leader>t <Cmd>lua require("translate").translateN()<cr>

        command! Translate  lua require("translate").translateN()
        command! TranslateV lua require("translate").translateV()
    ]]
end

local bufferline_init = function()
    for i = 1, 9 do
        vim.keymap.set("n", "," .. i, function()
            require("bufferline").go_to_buffer(i, true)
        end)
    end

    vim.keymap.set("n", "," .. 0, function()
        require("bufferline").go_to_buffer(-1, true)
    end)

    vim.keymap.set("n", "<Tab>", function()
        require("bufferline").cycle(1)
    end)
    vim.keymap.set("n", "<S-Tab>", function()
        require("bufferline").cycle(-1)
    end)
end

local bufferline_cfg = function()
    require("bufferline").setup({
        options = {
            mode = "buffers",
            numbers = "ordinal",
            indicator = { icon = "" },
            max_name_length = 20,
            max_prefix_length = 2,
            modified_icon = "●",
            persist_buffer_sort = false,
            show_buffer_close_icons = false,
            show_buffer_icons = false,
            show_close_icon = false,
            name_formatter = function(opts)
                return string.format("%s", opts.name)
            end,
        },
    })
end

local telescope_cfg = function()
    require("telescope").setup({
        extensions = {
            coc = {
                theme = 'ivy',
                prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            }
        },
    })
    require('telescope').load_extension('coc')
    require("telescope").load_extension("lazygit")
end

local lazygit_cfg = function() vim.cmd [[ nnoremap <silent> <localleader>n :LazyGit<CR> ]] end

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
local plugins = {
    { "dracula/vim",                    name = "dracula", },
    { "mhinz/vim-startify",             config = startify_cfg },
    { "nvim-tree/nvim-web-devicons",    event = 'VeryLazy', },
    { "tpope/vim-endwise",              event = 'VeryLazy', },
    { "scrooloose/nerdcommenter",       event = 'VeryLazy', },
    { "vim-scripts/DoxygenToolkit.vim", event = 'VeryLazy', },
    { "MattesGroeger/vim-bookmarks",    event = 'VeryLazy', },
    { "tpope/vim-abolish",              event = 'VeryLazy', },
    { "skywind3000/asyncrun.vim",       event = 'VeryLazy', },
    { "mbbill/undotree",                event = 'VeryLazy', },
    { "nvim-lua/plenary.nvim" },
    { "neoclide/coc.nvim",              branch = "release" },
    {
        "nvim-telescope/telescope.nvim",
        config = telescope_cfg,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { "kdheepak/lazygit.nvim",         config = lazygit_cfg },
    { "fannheyward/telescope-coc.nvim" },
    { "m-pilia/vim-ccls",              event = 'VeryLazy', },
    { "skywind3000/vim-terminal-help", event = 'VeryLazy', },
    { "mg979/vim-visual-multi",        event = 'VeryLazy',    config = function() vim.g.terminal_list = 0 end },
    { "gyl30/translate",               config = translate_cfg },
    { "nvim-lualine/lualine.nvim",     config = line_cfg,     event = 'VeryLazy', },
    { "sunjon/shade.nvim",             config = shade_cfg,    event = 'VeryLazy', },
    { "preservim/tagbar",              config = tagbar_cfg,   event = 'VeryLazy', },
    {
        "akinsho/nvim-bufferline.lua",
        event = "VeryLazy",
        init = bufferline_init,
        config =
            bufferline_cfg
    },
    { "luochen1990/rainbow",        config = rainbow_cfg,          event = 'VeryLazy', },
    { "skywind3000/asynctasks.vim", config = asynctasks_cfg,       event = 'VeryLazy', },
    { "lfv89/vim-interestingwords", config = interestingwords_cfg, event = 'VeryLazy', },
    { "skywind3000/vim-cppman",     config = cppman_cfg,           event = 'VeryLazy', },
    {
        "Yggdroot/LeaderF",
        build = ":LeaderfInstallCExtension",
        config = leaderf_cfg,
        init = function()
            vim.g.Lf_ShortcutF = ""
            vim.g.Lf_ShortcutB = ""
        end,
        event = 'VeryLazy',
    },
    {
        "antoinemadec/coc-fzf",
        config = fzf_cfg,
        dependencies = { "junegunn/fzf", "junegunn/fzf.vim" },
    },
    { "rcarriga/nvim-notify" },
}

require("lazy").setup({ spec = plugins, opts })
