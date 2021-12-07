
local util = require("config.util")
util.nmap("<C-j>", "<Plug>(coc-definition)")
util.nmap("gd", "<Plug>(coc-definition)")
util.nmap("gr", "<Plug>(coc-references)")

util.nmap('<C-h>', '<C-w>h')
util.nmap('<C-l>', '<C-w>l')
util.nmap('<C-j>', '<C-w>j')
util.nmap('<C-k>', '<C-w>k')
util.nmap('<space><space>', '%')
util.nmap('<leader>q', ':q!<CR>')

util.imap('jk', '<esc>')




