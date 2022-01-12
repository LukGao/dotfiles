return function()
    require('nvim-treesitter.configs').setup({

        indent = {
            enable = true
        },
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = {} -- list of language that will be disabled
        },

        rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
    })
    require("nvim-treesitter.install").prefer_git = true
end
