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


local util = require('config.util')

util.nmap('<c-f>', ':LeaderfFunction<CR>')
util.nmap('<c-m>', ':LeaderfMru<CR>')


