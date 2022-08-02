return function()
    require('nvim-treesitter.configs').setup({
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
      -- 启用增量选择
      --incremental_selection = {
        --enable = true,
        --keymaps = {
          --init_selection = '<CR>',
          --node_incremental = '<CR>',
          --node_decremental = '<BS>',
          --scope_incremental = '<TAB>',
        --}
      --},
      -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
      --indent = {
        --enable = true
      --}
    })
    --vim.wo.foldlevel = 99
    --vim.wo.foldmethod = 'expr'
    --vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    require("nvim-treesitter.install").prefer_git = true
end
