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
    autopairs = {
      enable = true
    },
   rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
    matchip = {enable = true},

    textobjects = {
      select = {
        enable = false,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = false,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          
          ["ap"] = "@parameter.outer",
          ["ip"] = "@parameter.inner",
          ["am"] = "@comment.outer",

          ["ab"] = "@block.outer",
          ["as"] = "@statement.outer",
        
          ["ad"] = "@conditional.outer",
          ["id"] = "@conditional.inner",          
        },
      },
    },
  })
end
