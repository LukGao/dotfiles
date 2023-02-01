vim.g.mapleader=','
vim.g.maplocalleader=';'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.opt.fileencodings='utf8,ucs-bom,gbk,cp936,gb2312,gb18030'
vim.opt.fileencoding='utf-8'
vim.opt.termguicolors=true
vim.opt.number=true
vim.opt.showcmd=false
vim.opt.mouse=''
-- vim.opt.cursorline=true
vim.opt.ttimeoutlen=0
vim.opt.laststatus=2
vim.opt.cmdheight=1
vim.opt.showtabline=0
vim.opt.showmode=false
vim.opt.autochdir=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.smarttab=true
vim.opt.expandtab=true
vim.opt.wrap=false
vim.opt.sidescroll=10
vim.opt.colorcolumn='100'
vim.opt.hidden=true
vim.opt.shortmess='aFc'
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.autowrite=true
vim.opt.confirm=true
vim.opt.langmenu='zh_CN.UTF-8'
vim.opt.fillchars = "vert:│"
vim.opt.virtualedit={'block','onemore'}
vim.opt.helplang='cn'
vim.opt.encoding='utf8'
vim.opt.updatecount=100
vim.opt.undofile=true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.scrolloff=15
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.cmd[[
autocmd FileType * setlocal formatoptions-=o
]]
vim.opt.wildignore:append'*.pyc,*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib'
vim.opt.wildignore:append'*_build/*,*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex'
vim.opt.wildignore:append'***/coverage/*,*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags'
vim.opt.wildignore:append'***/node_modules/*,*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz'
vim.opt.wildignore:append'***/android/*,*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso'
vim.opt.wildignore:append'***/ios/*,*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub'
vim.opt.wildignore:append'***/.git/*,*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc'
vim.opt.wildignore:append'*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps'
vim.opt.wildignore:append'*/.git/*,*/.svn/*,*.DS_Store'
vim.opt.wildignore:append'*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*'

local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
vim.opt.directory = cache_dir .. 'swag/'
vim.opt.undodir = cache_dir .. 'undo/'
vim.opt.backupdir = cache_dir .. 'backup/'
vim.opt.viewdir = cache_dir .. 'view/'
vim.opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
vim.opt.clipboard = 'unnamedplus'

local disabled_plugins = {
	'2html_plugin',
	'getscript',
	'getscriptPlugin',
	'gzip',
	'logipat',
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'matchit',
	'tar',
	'tarPlugin',
	'rrhelper',
	'spellfile_plugin',
	'vimball',
	'vimballPlugin',
	'zip',
	'zipPlugin',
	'node_provider',
	'ruby_provider',
	'perl_provider',
	'tutor',
	'rplugin',
	'syntax',
	'synmenu',
	'optwin',
	'compiler',
	'bugreport',
	'ftplugin',
}

for _, plugin in pairs(disabled_plugins) do
	vim.g['loaded_' .. plugin] = 1
end

vim.g.python_host_prog = '/user/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'

if vim.fn.empty(vim.fn.glob('/opt/rh/rh-python38/root/bin/python')) == 0 then
    vim.g.python3_host_prog = '/opt/rh/rh-python38/root/bin/python'
    vim.g.python_host_prog = '/opt/rh/rh-python38/root/bin/python'
end

if vim.loop.os_uname().sysname == 'Darwin' then
    vim.g.python_host_prog = '/user/local/bin/python'
    vim.g.python3_host_prog = '/usr/local/bin/python3'
end
