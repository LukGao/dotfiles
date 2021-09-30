lua <<EOF

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = { "NvimTree" }


local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#ec5f67'
}
local icons = {
  locker = '', -- f023
  not_modifiable = '', -- f05e
  unsaved = '', -- f0c7
  pencil = '', -- f040
  dos = '', -- e70f
  unix = '', -- f17c
  mac = '', -- f179
  page = '☰', -- 2630
  connected = '', -- f817
  disconnected = '', -- f818
  error = '', -- f658
  warning = '', -- f06a
  info = '', -- f05a
}


local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end


local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end


function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
    local has_func, func_name = pcall(vim.api.nvim_buf_get_var, 0, 'coc_current_function')
    if not has_func then return nil end
    return string.sub(func_name,4) 
end

local function get_function_info()
    if vim.fn.exists('*coc#rpc#start_server') == 1 then
        return get_current_func()
    end
    return ''
end

CocStatus = get_diagnostic_info

CocFunc = get_function_info

local i = 1


gls.left[i] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = {colors.blue,colors.yellow}
  },
}

i = i + 1

gls.left[i] = {
  ViMode = {
    provider = function()
      local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL LINE', [''] = 'VISUAL BLOCK'}
      if alias[vim.fn.mode()] ~= nil then
        return ' ' .. alias[vim.fn.mode()]
      else
        return ' '  .. vim.fn.mode()
      end
    end,
    separator = '',
    separator_highlight = {colors.darkblue,function()
      if not buffer_not_empty() then
        return colors.darkblue
      end
        return colors.purple
    end},


    highlight = {colors.darkblue,colors.purple,'bold'},
  },
}

i = i + 1
gls.left[i] = {
  Whitespace = {
    provider = function()return '' end,
    separator = ' ',
    separator_highlight = {colors.purple,colors.darkblue},
    condition = buffer_not_empty,
    highlight = {colors.darkblue,colors.darkblue}
  }
}

i = i + 1
gls.left[i] ={
  FileIcon = {
    provider = {'FileIcon'},
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue},
  },
}
i = i + 1
gls.left[i] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    highlight = {colors.magenta,colors.darkblue}
  }
}


i = 1
gls.right[i] = {
    CocFunc = {
        provider = function()
            if CocFunc() ~= nil and CocFunc() ~= '' then
                return ' ⨍' .. CocFunc() .. ' '
            else
                return  ''
            end
        end,
        condition = buffer_not_empty,
        highlight = {colors.magenta,colors.darkblue,'bold'}
    }
}

i = i + 1
gls.right[i] = {
  FileFormat = {
    provider = function()
      if not buffer_not_empty() then return '' end
      local icon = icons[vim.bo.fileformat] or ''
      return string.format(' %s %s ', icon, vim.bo.fileencoding)
    end,
    separator = '',
    separator_highlight = {colors.purple,function()
      if not buffer_not_empty() then
        return colors.purple
      end
        return colors.darkblue
    end},

    highlight = {colors.grey,colors.purple},
  }
}

i = i + 1
gls.right[i] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '☰ ',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.grey,colors.purple},
  },
}
i = i + 1
gls.right[i] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.grey,colors.darkblue},
  }
}
i = i + 1
gls.right[i] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.purple},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}

EOF
