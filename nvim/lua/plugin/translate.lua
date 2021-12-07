
local util = require('config.util')


util.nmap('<leader>w', '<Plug>TranslateW')
util.vmap('<leader>w', '<Plug>TranslateWV')

vim.g.translator_default_engines={'bing','haici','youdao','google'}
-- vim.g.translator_proxy_url = 'socks5://192.168.1.1:1080'