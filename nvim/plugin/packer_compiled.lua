-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gyl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gyl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gyl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gyl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gyl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LeaderF = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/LeaderF",
    url = "https://github.com/Yggdroot/LeaderF"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  dracula = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  hop = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/hop",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n®\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\4\15toggle_key\n<M-s>\16hint_prefix\tÓûõ \16hint_enable\1\20floating_window\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rwinwidth\afn\bvimñ\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\vÄ\21\2\1\0)\3\0\0\1\3\2\0X\2\4Ä\21\2\1\0\21\3\0\0\0\2\3\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0L\0\2\0\tmode\18nvim_get_mode\bapi\bvim0\0\0\3\2\1\0\t-\0\0\0B\0\1\2-\1\1\0008\1\0\1\14\0\1\0X\2\2Ä'\2\0\0L\2\2\0L\1\2\0\4¿\3¿\5I\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_x\rsections\vinsert\ntableR\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_c\22inactive_sections\vinsert\ntableR\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_x\22inactive_sections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäÃ\5\0\0\a\0023\0z5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\3\1=\1\5\0-\1\0\0009\1\3\1=\1\6\0-\1\0\0009\1\3\1=\1\a\0-\1\0\0009\1\0\1=\1\b\0-\1\0\0009\1\0\1=\1\t\0-\1\0\0009\1\0\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\f\1=\1\16\0-\1\0\0009\1\f\1=\1\17\0-\1\0\0009\1\f\1=\1\18\0-\1\0\0009\1\19\1=\1\20\0-\1\0\0009\1\19\1=\1\21\0-\1\0\0009\1\19\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0-\1\0\0009\1\0\1=\1\29\0-\1\0\0009\1\0\1=\1\30\0-\1\0\0009\1\0\1=\1\31\0-\1\0\0009\1\0\1=\1 \0-\1\0\0009\1!\1=\1\"\0-\1\0\0009\1!\1=\1#\0-\1\0\0009\1\0\1=\1$\0-\1\0\0009\1%\1=\1&\0-\1\0\0009\1%\1=\1'\0-\1\0\0009\1%\1=\1(\0-\1\0\0009\1\3\1=\1)\0-\1\0\0009\1\3\1=\1*\0006\1+\0009\1,\0019\1-\1'\3.\0006\4+\0009\4/\0049\0040\4B\4\1\0028\4\4\0'\0051\0-\6\0\0009\0062\6&\3\6\3B\1\2\1-\1\1\0D\1\1\0\1¿\5¿\abg\f guibg=\tmode\afn$hi! LualineMode gui=bold guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\6c\fmagenta\bRvx\bRvc\aRv\aRx\aRc\6R\aix\aic\6i\ngreen\6\19\6S\6s\vorange\a\22s\6\22\aVs\6V\avs\6v\tblue\ant\bniV\bniR\bniI\bno\22\bnoV\bnov\ano\bred\6n\1\0\0\vviolet\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=≥\3\0\0\14\0\21\2B'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0'\3\b\0006\4\t\0\18\6\2\0B\4\2\4X\a\24Ä9\t\n\b9\t\v\t\15\0\t\0X\n\20Ä6\n\1\0009\n\f\n9\n\r\n\18\f\t\0\18\r\1\0B\n\3\2\b\n\0\0X\n\fÄ9\n\14\b6\v\1\0009\v\f\v9\v\15\vB\v\1\0028\n\v\n\n\n\0\0X\n\4Ä\18\n\3\0009\v\16\b'\f\17\0&\3\f\nE\a\3\3R\aÊ6\4\18\0009\4\19\4\18\6\3\0B\4\2\2)\5\0\0\1\5\4\0X\4\nÄ6\4\18\0009\4\20\4\18\6\3\0)\a\1\0006\b\18\0009\b\19\b\18\n\3\0B\b\2\2\23\b\1\bD\4\4\0L\0\2\0\bsub\blen\vstring\6 \tname\nbufnr\21attached_buffers\nindex\afn\14filetypes\vconfig\vipairs\5\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31\2\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäÖ\19\1\0\17\0p\0Â\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\n\0003\4\v\0003\5\f\0005\6\25\0005\a\r\0005\b\19\0005\t\17\0005\n\15\0009\v\14\1=\v\14\n9\v\16\1=\v\16\n=\n\18\t=\t\20\b5\t\22\0005\n\21\0009\v\14\1=\v\14\n9\v\16\1=\v\16\n=\n\18\t=\t\23\b=\b\24\a=\a\26\0065\a\27\0004\b\0\0=\b\28\a4\b\0\0=\b\29\a4\b\0\0=\b\30\a4\b\0\0=\b\31\a4\b\0\0=\b \a4\b\0\0=\b!\a=\a\"\0065\a#\0004\b\0\0=\b\28\a4\b\0\0=\b$\a4\b\0\0=\b\30\a4\b\0\0=\b\31\a4\b\0\0=\b \a4\b\0\0=\b!\a=\a%\0063\a&\0003\b'\0003\t(\0003\n)\0\18\v\a\0005\r-\0003\14*\0>\14\1\r5\14,\0009\15+\1=\15\14\14=\14.\r5\14/\0=\0140\rB\v\2\1\18\v\a\0005\r2\0003\0141\0>\14\1\r5\0143\0=\0140\rB\v\2\1\18\v\a\0005\r4\0009\14\5\2=\0145\rB\v\2\1\18\v\a\0005\r6\0009\14\5\2=\0145\r5\0148\0009\0157\1=\15\14\14=\14.\rB\v\2\1\18\v\a\0005\r9\0005\14;\0009\15:\1=\15\14\14=\14.\rB\v\2\1\18\v\a\0005\r<\0005\14=\0=\14>\r5\14A\0005\15@\0009\16?\1=\16\14\15=\15B\0145\15D\0009\16C\1=\16\14\15=\15E\0145\15G\0009\16F\1=\16\14\15=\15H\14=\14I\r9\14\a\2=\0145\rB\v\2\1\18\v\a\0004\r\3\0003\14J\0>\14\1\rB\v\2\1\18\v\a\0005\rL\0003\14K\0>\14\1\r5\14N\0009\15M\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rO\0005\14P\0=\14Q\r5\14R\0=\14>\r5\14T\0005\15S\0009\16F\1=\16\14\15=\15U\0145\15W\0009\16V\1=\16\14\15=\15X\0145\15Y\0009\16M\1=\16\14\15=\15Z\14=\14[\rB\v\2\1\18\v\b\0005\r\\\0006\14]\0009\14^\14=\14_\r9\14\a\2=\0145\r5\14`\0009\15?\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\ra\0006\14]\0009\14^\14=\14_\r5\14b\0009\15?\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rc\0B\v\2\1\18\v\b\0005\rd\0005\14e\0009\15\14\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rh\0003\14f\0>\14\1\r5\14g\0009\15+\1=\15\14\14=\14.\r5\14i\0=\0140\rB\v\2\1\18\v\t\0005\rj\0009\14\5\2=\0145\r5\14k\0009\0157\1=\15\14\14=\14.\rB\v\2\1\18\v\n\0005\rl\0B\v\2\1\18\v\n\0005\rm\0005\14n\0009\15\14\1=\15\14\14=\14.\rB\v\2\0019\vo\0\18\r\6\0B\v\2\0012\0\0ÄK\0\1\0\nsetup\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\1\2\0\0\rfilename\1\0\2\nright\3\0\tleft\3\1\1\0\0\1\0\0\0\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\bfmt\nupper\vstring\1\2\0\0\15o:encoding\22diagnostics_color\15color_info\1\0\0\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\1\0\3\nerror\tÔÅó \twarn\tÔÅ± \tinfo\tÔÅ™ \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\tcyan\1\0\1\ticon\rÔÇÖ LSP:\0\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\ngreen\fsymbols\1\0\3\fremoved\tÔÖÜ \nadded\tÔÉæ \rmodified\tÔßâ \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\bÔëø\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\nright\3\1\tleft\3\0\ncolor\1\0\0\1\0\0\tblue\0\0\0\0\0\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\0\0\1\0#\aRx\fREPLACE\aRc\fREPLACE\bniV\vNORMAL\bniR\vNORMAL\6c\fCOMMAND\bno\22\14O-PENDING\bnoV\14O-PENDING\bnov\14O-PENDING\6S\vS-LINE\ano\14O-PENDING\a\22s\fV-BLOCK\6i\vINSERT\aVs\vV-LINE\6R\fREPLACE\bniI\vNORMAL\aix\vI-COMP\ant\vNORMAL\aRv\14V-REPLACE\6t\rTERMINAL\6s\vSELECT\6n\vNORMAL\6v\vVISUAL\aic\vI-COMP\6\22\fV-BLOCK\6r\fREPLACE\6\19\fS-BLOCK\6!\nSHELL\ar?\fCONFIRM\arm\tMORE\ace\14EX-NORMAL\acv\15EX-COMMAND\bRvx\14V-REPLACE\bRvc\14V-REPLACE\6V\vV-LINE\avs\vVISUAL\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\vorange\f#FF8800\vyellow\f#ECBE7B\ngreen\f#98be65\tblue\f#51afef\rdarkblue\f#081633\bred\f#ec5f67\tcyan\f#008080\abg\f#202328\afg\f#bbc2cf\fmagenta\f#c678dd\vviolet\f#a9a1e1\flualine\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neomake = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/neomake",
    url = "https://github.com/neomake/neomake"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\np\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\3¿\4¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0¿\3¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2e\0\2\a\1\5\0\0176\2\0\0009\2\1\0029\4\2\1B\2\2\2-\3\0\0\1\3\2\0X\2\tÄ6\2\0\0009\2\3\0029\4\2\1)\5\1\0-\6\0\0B\2\4\2'\3\4\0&\2\3\2=\2\2\1L\1\2\0\2¿\bÔõó\bsub\tabbr\blen\vstringè\n\1\0\16\0K\0ó\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\2)\0022\0003\3\4\0003\4\5\0009\5\6\0005\a\b\0005\b\a\0=\b\t\a5\b\v\0003\t\n\0=\t\f\b=\b\r\a5\b\21\0009\t\14\0009\v\14\0009\v\15\v5\r\18\0009\14\16\0009\14\17\14=\14\19\rB\v\2\0025\f\20\0B\t\3\2=\t\22\b9\t\14\0009\v\14\0009\v\23\v5\r\24\0009\14\16\0009\14\17\14=\14\19\rB\v\2\0025\f\25\0B\t\3\2=\t\26\b9\t\14\0009\v\14\0009\v\27\v)\r¸ˇB\v\2\0025\f\28\0B\t\3\2=\t\29\b9\t\14\0009\v\14\0009\v\27\v)\r\4\0B\v\2\0025\f\30\0B\t\3\2=\t\31\b9\t\14\0009\v\14\0009\v \vB\v\1\0025\f!\0B\t\3\2=\t\"\b9\t#\0009\t$\t=\t%\b9\t\14\0005\v'\0009\f\14\0009\f&\fB\f\1\2=\f(\v9\f\14\0009\f)\fB\f\1\2=\f*\vB\t\2\2=\t+\b9\t\14\0005\v0\0009\f\14\0009\f,\f5\14/\0009\15-\0009\15.\15=\15\19\14B\f\2\2=\f(\v9\f\14\0009\f,\f5\0141\0B\f\2\2=\f*\vB\t\2\2=\t2\b9\t\14\0003\v3\0005\f4\0B\t\3\2=\t5\b9\t\14\0003\v6\0005\f7\0B\t\3\2=\t8\b=\b\14\a4\b\5\0005\t9\0>\t\1\b5\t:\0>\t\2\b5\t;\0>\t\3\b5\t<\0>\t\4\b=\b=\a5\b>\0003\t?\0=\t@\b=\bA\aB\5\2\0019\5\6\0009\5B\5'\aC\0005\bE\0005\tD\0=\t\t\b9\t#\0009\t=\t4\v\3\0005\fF\0>\f\1\v4\f\3\0005\rG\0>\r\1\fB\t\3\2=\t=\bB\5\3\0019\5\6\0009\5B\5'\aH\0005\bJ\0004\t\3\0005\nI\0>\n\1\t=\t=\bB\5\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\1\0\2\16completeopt!menu,menuone,insert,noselect\17autocomplete\1\6:\fcmdline\15formatting\vformat\0\1\0\1\15deprecated\2\fsources\1\0\1\tname\tpath\1\0\2\19max_item_count\3\n\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\nvsnip\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\1\0\0\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-p>\1\3\0\0\6i\6c\1\0\0\21select_prev_item\n<C-n>\1\0\0\1\3\0\0\6i\6c\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fmapping\fsnippet\vexpand\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt#menu,menuone,noinsert,noselect\nsetup\0\0\20is_cmdline_mode\18cmp.utils.api\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\blsp\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n´\4\0\0\6\0\22\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\v\aas\21@statement.outer\aac\17@class.outer\aic\17@class.inner\aaf\20@function.outer\aad\23@conditional.outer\aif\20@function.inner\aab\17@block.outer\aam\19@comment.outer\aid\23@conditional.inner\aip\21@parameter.inner\aap\21@parameter.outer\1\0\2\venable\1\14lookahead\1\fmatchip\1\0\1\venable\2\frainbow\1\0\2\venable\2\18extended_mode\2\14autopairs\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\19ignore_install\vindent\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-bookmarks",
    url = "https://github.com/MattesGroeger/vim-bookmarks"
  },
  ["vim-buffet"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-buffet",
    url = "https://github.com/bagrat/vim-buffet"
  },
  ["vim-cppman"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-cppman",
    url = "https://github.com/skywind3000/vim-cppman"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-interestingwords"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-interestingwords",
    url = "https://github.com/lfv89/vim-interestingwords"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-function"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-textobj-function",
    url = "https://github.com/kana/vim-textobj-function"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-textobj-indent",
    url = "https://github.com/kana/vim-textobj-indent"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-syntax"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-textobj-syntax",
    url = "https://github.com/kana/vim-textobj-syntax"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/gyl/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n´\4\0\0\6\0\22\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\v\aas\21@statement.outer\aac\17@class.outer\aic\17@class.inner\aaf\20@function.outer\aad\23@conditional.outer\aif\20@function.inner\aab\17@block.outer\aam\19@comment.outer\aid\23@conditional.inner\aip\21@parameter.inner\aap\21@parameter.outer\1\0\2\venable\1\14lookahead\1\fmatchip\1\0\1\venable\2\frainbow\1\0\2\venable\2\18extended_mode\2\14autopairs\1\0\1\venable\2\14highlight\fdisable\1\0\1\venable\2\19ignore_install\vindent\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\blsp\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\np\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\3¿\4¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\0¿\3¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2e\0\2\a\1\5\0\0176\2\0\0009\2\1\0029\4\2\1B\2\2\2-\3\0\0\1\3\2\0X\2\tÄ6\2\0\0009\2\3\0029\4\2\1)\5\1\0-\6\0\0B\2\4\2'\3\4\0&\2\3\2=\2\2\1L\1\2\0\2¿\bÔõó\bsub\tabbr\blen\vstringè\n\1\0\16\0K\0ó\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\2)\0022\0003\3\4\0003\4\5\0009\5\6\0005\a\b\0005\b\a\0=\b\t\a5\b\v\0003\t\n\0=\t\f\b=\b\r\a5\b\21\0009\t\14\0009\v\14\0009\v\15\v5\r\18\0009\14\16\0009\14\17\14=\14\19\rB\v\2\0025\f\20\0B\t\3\2=\t\22\b9\t\14\0009\v\14\0009\v\23\v5\r\24\0009\14\16\0009\14\17\14=\14\19\rB\v\2\0025\f\25\0B\t\3\2=\t\26\b9\t\14\0009\v\14\0009\v\27\v)\r¸ˇB\v\2\0025\f\28\0B\t\3\2=\t\29\b9\t\14\0009\v\14\0009\v\27\v)\r\4\0B\v\2\0025\f\30\0B\t\3\2=\t\31\b9\t\14\0009\v\14\0009\v \vB\v\1\0025\f!\0B\t\3\2=\t\"\b9\t#\0009\t$\t=\t%\b9\t\14\0005\v'\0009\f\14\0009\f&\fB\f\1\2=\f(\v9\f\14\0009\f)\fB\f\1\2=\f*\vB\t\2\2=\t+\b9\t\14\0005\v0\0009\f\14\0009\f,\f5\14/\0009\15-\0009\15.\15=\15\19\14B\f\2\2=\f(\v9\f\14\0009\f,\f5\0141\0B\f\2\2=\f*\vB\t\2\2=\t2\b9\t\14\0003\v3\0005\f4\0B\t\3\2=\t5\b9\t\14\0003\v6\0005\f7\0B\t\3\2=\t8\b=\b\14\a4\b\5\0005\t9\0>\t\1\b5\t:\0>\t\2\b5\t;\0>\t\3\b5\t<\0>\t\4\b=\b=\a5\b>\0003\t?\0=\t@\b=\bA\aB\5\2\0019\5\6\0009\5B\5'\aC\0005\bE\0005\tD\0=\t\t\b9\t#\0009\t=\t4\v\3\0005\fF\0>\f\1\v4\f\3\0005\rG\0>\r\1\fB\t\3\2=\t=\bB\5\3\0019\5\6\0009\5B\5'\aH\0005\bJ\0004\t\3\0005\nI\0>\n\1\t=\t=\bB\5\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\1\0\2\16completeopt!menu,menuone,insert,noselect\17autocomplete\1\6:\fcmdline\15formatting\vformat\0\1\0\1\15deprecated\2\fsources\1\0\1\tname\tpath\1\0\2\19max_item_count\3\n\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\nvsnip\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\1\0\0\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-p>\1\3\0\0\6i\6c\1\0\0\21select_prev_item\n<C-n>\1\0\0\1\3\0\0\6i\6c\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fmapping\fsnippet\vexpand\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt#menu,menuone,noinsert,noselect\nsetup\0\0\20is_cmdline_mode\18cmp.utils.api\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rwinwidth\afn\bvimñ\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\vÄ\21\2\1\0)\3\0\0\1\3\2\0X\2\4Ä\21\2\1\0\21\3\0\0\0\2\3\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvim:\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0L\0\2\0\tmode\18nvim_get_mode\bapi\bvim0\0\0\3\2\1\0\t-\0\0\0B\0\1\2-\1\1\0008\1\0\1\14\0\1\0X\2\2Ä'\2\0\0L\2\2\0L\1\2\0\4¿\3¿\5I\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_x\rsections\vinsert\ntableR\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_c\22inactive_sections\vinsert\ntableR\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\6¿\14lualine_x\22inactive_sections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäÃ\5\0\0\a\0023\0z5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\3\1=\1\5\0-\1\0\0009\1\3\1=\1\6\0-\1\0\0009\1\3\1=\1\a\0-\1\0\0009\1\0\1=\1\b\0-\1\0\0009\1\0\1=\1\t\0-\1\0\0009\1\0\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\f\1=\1\16\0-\1\0\0009\1\f\1=\1\17\0-\1\0\0009\1\f\1=\1\18\0-\1\0\0009\1\19\1=\1\20\0-\1\0\0009\1\19\1=\1\21\0-\1\0\0009\1\19\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0-\1\0\0009\1\0\1=\1\29\0-\1\0\0009\1\0\1=\1\30\0-\1\0\0009\1\0\1=\1\31\0-\1\0\0009\1\0\1=\1 \0-\1\0\0009\1!\1=\1\"\0-\1\0\0009\1!\1=\1#\0-\1\0\0009\1\0\1=\1$\0-\1\0\0009\1%\1=\1&\0-\1\0\0009\1%\1=\1'\0-\1\0\0009\1%\1=\1(\0-\1\0\0009\1\3\1=\1)\0-\1\0\0009\1\3\1=\1*\0006\1+\0009\1,\0019\1-\1'\3.\0006\4+\0009\4/\0049\0040\4B\4\1\0028\4\4\0'\0051\0-\6\0\0009\0062\6&\3\6\3B\1\2\1-\1\1\0D\1\1\0\1¿\5¿\abg\f guibg=\tmode\afn$hi! LualineMode gui=bold guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\6c\fmagenta\bRvx\bRvc\aRv\aRx\aRc\6R\aix\aic\6i\ngreen\6\19\6S\6s\vorange\a\22s\6\22\aVs\6V\avs\6v\tblue\ant\bniV\bniR\bniI\bno\22\bnoV\bnov\ano\bred\6n\1\0\0\vviolet\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=≥\3\0\0\14\0\21\2B'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0'\3\b\0006\4\t\0\18\6\2\0B\4\2\4X\a\24Ä9\t\n\b9\t\v\t\15\0\t\0X\n\20Ä6\n\1\0009\n\f\n9\n\r\n\18\f\t\0\18\r\1\0B\n\3\2\b\n\0\0X\n\fÄ9\n\14\b6\v\1\0009\v\f\v9\v\15\vB\v\1\0028\n\v\n\n\n\0\0X\n\4Ä\18\n\3\0009\v\16\b'\f\17\0&\3\f\nE\a\3\3R\aÊ6\4\18\0009\4\19\4\18\6\3\0B\4\2\2)\5\0\0\1\5\4\0X\4\nÄ6\4\18\0009\4\20\4\18\6\3\0)\a\1\0006\b\18\0009\b\19\b\18\n\3\0B\b\2\2\23\b\1\bD\4\4\0L\0\2\0\bsub\blen\vstring\6 \tname\nbufnr\21attached_buffers\nindex\afn\14filetypes\vconfig\vipairs\5\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31\2\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäÖ\19\1\0\17\0p\0Â\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\n\0003\4\v\0003\5\f\0005\6\25\0005\a\r\0005\b\19\0005\t\17\0005\n\15\0009\v\14\1=\v\14\n9\v\16\1=\v\16\n=\n\18\t=\t\20\b5\t\22\0005\n\21\0009\v\14\1=\v\14\n9\v\16\1=\v\16\n=\n\18\t=\t\23\b=\b\24\a=\a\26\0065\a\27\0004\b\0\0=\b\28\a4\b\0\0=\b\29\a4\b\0\0=\b\30\a4\b\0\0=\b\31\a4\b\0\0=\b \a4\b\0\0=\b!\a=\a\"\0065\a#\0004\b\0\0=\b\28\a4\b\0\0=\b$\a4\b\0\0=\b\30\a4\b\0\0=\b\31\a4\b\0\0=\b \a4\b\0\0=\b!\a=\a%\0063\a&\0003\b'\0003\t(\0003\n)\0\18\v\a\0005\r-\0003\14*\0>\14\1\r5\14,\0009\15+\1=\15\14\14=\14.\r5\14/\0=\0140\rB\v\2\1\18\v\a\0005\r2\0003\0141\0>\14\1\r5\0143\0=\0140\rB\v\2\1\18\v\a\0005\r4\0009\14\5\2=\0145\rB\v\2\1\18\v\a\0005\r6\0009\14\5\2=\0145\r5\0148\0009\0157\1=\15\14\14=\14.\rB\v\2\1\18\v\a\0005\r9\0005\14;\0009\15:\1=\15\14\14=\14.\rB\v\2\1\18\v\a\0005\r<\0005\14=\0=\14>\r5\14A\0005\15@\0009\16?\1=\16\14\15=\15B\0145\15D\0009\16C\1=\16\14\15=\15E\0145\15G\0009\16F\1=\16\14\15=\15H\14=\14I\r9\14\a\2=\0145\rB\v\2\1\18\v\a\0004\r\3\0003\14J\0>\14\1\rB\v\2\1\18\v\a\0005\rL\0003\14K\0>\14\1\r5\14N\0009\15M\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rO\0005\14P\0=\14Q\r5\14R\0=\14>\r5\14T\0005\15S\0009\16F\1=\16\14\15=\15U\0145\15W\0009\16V\1=\16\14\15=\15X\0145\15Y\0009\16M\1=\16\14\15=\15Z\14=\14[\rB\v\2\1\18\v\b\0005\r\\\0006\14]\0009\14^\14=\14_\r9\14\a\2=\0145\r5\14`\0009\15?\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\ra\0006\14]\0009\14^\14=\14_\r5\14b\0009\15?\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rc\0B\v\2\1\18\v\b\0005\rd\0005\14e\0009\15\14\1=\15\14\14=\14.\rB\v\2\1\18\v\b\0005\rh\0003\14f\0>\14\1\r5\14g\0009\15+\1=\15\14\14=\14.\r5\14i\0=\0140\rB\v\2\1\18\v\t\0005\rj\0009\14\5\2=\0145\r5\14k\0009\0157\1=\15\14\14=\14.\rB\v\2\1\18\v\n\0005\rl\0B\v\2\1\18\v\n\0005\rm\0005\14n\0009\15\14\1=\15\14\14=\14.\rB\v\2\0019\vo\0\18\r\6\0B\v\2\0012\0\0ÄK\0\1\0\nsetup\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\1\2\0\0\rfilename\1\0\2\nright\3\0\tleft\3\1\1\0\0\1\0\0\0\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\bfmt\nupper\vstring\1\2\0\0\15o:encoding\22diagnostics_color\15color_info\1\0\0\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\1\0\3\nerror\tÔÅó \twarn\tÔÅ± \tinfo\tÔÅ™ \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\tcyan\1\0\1\ticon\rÔÇÖ LSP:\0\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\ngreen\fsymbols\1\0\3\fremoved\tÔÖÜ \nadded\tÔÉæ \rmodified\tÔßâ \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\bÔëø\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\1\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\nright\3\1\tleft\3\0\ncolor\1\0\0\1\0\0\tblue\0\0\0\0\0\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\0\0\1\0#\aRx\fREPLACE\aRc\fREPLACE\bniV\vNORMAL\bniR\vNORMAL\6c\fCOMMAND\bno\22\14O-PENDING\bnoV\14O-PENDING\bnov\14O-PENDING\6S\vS-LINE\ano\14O-PENDING\a\22s\fV-BLOCK\6i\vINSERT\aVs\vV-LINE\6R\fREPLACE\bniI\vNORMAL\aix\vI-COMP\ant\vNORMAL\aRv\14V-REPLACE\6t\rTERMINAL\6s\vSELECT\6n\vNORMAL\6v\vVISUAL\aic\vI-COMP\6\22\fV-BLOCK\6r\fREPLACE\6\19\fS-BLOCK\6!\nSHELL\ar?\fCONFIRM\arm\tMORE\ace\14EX-NORMAL\acv\15EX-COMMAND\bRvx\14V-REPLACE\bRvc\14V-REPLACE\6V\vV-LINE\avs\vVISUAL\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\vorange\f#FF8800\vyellow\f#ECBE7B\ngreen\f#98be65\tblue\f#51afef\rdarkblue\f#081633\bred\f#ec5f67\tcyan\f#008080\abg\f#202328\afg\f#bbc2cf\fmagenta\f#c678dd\vviolet\f#a9a1e1\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\4\15toggle_key\n<M-s>\16hint_prefix\tÓûõ \16hint_enable\1\20floating_window\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
