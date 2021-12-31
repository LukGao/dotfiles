return function ()

local lualine = require 'lualine'
local mode = require 'lualine.utils.mode'
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    always_divide_middle = false,
    disabled_filetypes = {'coc-explorer'},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end



ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}
ins_left {
  function()
    return mode.get_mode()
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}
local function format_file_size(file)
  local size = vim.fn.getfsize(file)
  if size == 0 or size == -1 or size == -2 then
    return ''
  end
  if size < 1024 then
    size = size .. 'b'
  elseif size < 1024 * 1024 then
    size = string.format('%.1f',size/1024) .. 'k'
  elseif size < 1024 * 1024 * 1024 then
    size = string.format('%.1f',size/1024/1024) .. 'm'
  else
    size = string.format('%.1f',size/1024/1024/1024) .. 'g'
  end
  return size .. ' '
end
local function file_readonly()
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon =  ''
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ''
end

local function get_current_file_name()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  local icon = ''
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. ' ' .. icon .. '  '
    end
  end
  return file .. ' '
end
local function get_file_icon()
  local icon = ''
  if vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
    icon = vim.fn.WebDevIconsGetFileTypeSymbol()
    return icon .. ' '
  end
  local ok,devicons = pcall(require,'nvim-web-devicons')
  if not ok then print('No icon plugin found. Please install \'kyazdani42/nvim-web-devicons\'') return '' end
  local f_name,f_extension = get_file_info()
  icon = devicons.get_icon(f_name,f_extension)
  if icon == nil then
    if user_icons[vim.bo.filetype] ~= nil then
      icon = user_icons[vim.bo.filetype][2]
    elseif user_icons[f_extension] ~= nil then
      icon = user_icons[f_extension][2]
    else
      icon = ''
    end
  end
  return icon .. ' '
end
ins_left {
  function()
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return get_file_icon()
  end,
  cond = conditions.buffer_not_empty,
  icons_enabled = true, 
  color = { fg = colors.magenta, gui = 'bold' },
}
ins_left {
  function()
    return '%='
  end,
}
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  function ()
      local has_func, func_name = pcall(vim.api.nvim_buf_get_var, 0, 'coc_current_function')
      if not has_func then return "" end
      return func_name
  end,
  icons_enabled = true, 
  color = { fg = '#ffffff', gui = 'bold' },
}

ins_right {
  'coc#status'
}

ins_right {
  function()
    return '%='
  end,
}


ins_right {
  function()
    local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
    return ' ' .. encode:upper()
  end,
  fmt = string.lower, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}
ins_right { 
  function()
    local line = vim.fn.line('.')
    local column = vim.fn.col('.')
    return string.format("%d:%d", line, column)
  end
}

ins_right { 
  function()
      local current_line = vim.fn.line('.')
      local total_line = vim.fn.line('$')
      if current_line == 1 then
        return 'Top'
      elseif current_line == vim.fn.line('$') then
        return 'Bot'
      end
      local result,_ = math.modf((current_line/total_line)*100)
      return result .. '%%'
  end
}

ins_right {
  function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local default_chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
    local index = 1

    if  current_line == 1 then
      index = 1
    elseif current_line == total_lines then
      index = #default_chars
    else
      local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
      index = vim.fn.float2nr(line_no_fraction * #default_chars)
      if index == 0 then
        index = 1
      end
    end
    return default_chars[index]
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

lualine.setup(config)

end
