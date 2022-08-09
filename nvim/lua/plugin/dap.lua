return function()
    local dap = require('dap')

    local dapui = require("dapui")
    dap.adapters.lldb = {
        type = 'executable',
        attach = {
            pidProperty = 'pid',
            pidSelect = 'ask',
        },
        command = 'lldb-vscode-14',
        env = {
            LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
        },
        name = 'lldb',
    }

    dap.defaults.fallback.exception_breakpoints = {'raised'}

    vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '🔵', texthl = '', linehl = '', numhl = '' })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
    dapui.setup({ floating = { border = "rounded" } })
    vim.cmd([[ autocmd FileType dap-repl set nobuflisted]])
    vim.cmd([[ autocmd FileType dap-repl,dapui_scopes,dapui_breakpoints,dapui_stacks,dapui_watches set nocursorline]])
    vim.api.nvim_set_keymap('n', '<localleader>dt', '<Cmd>lua require("dapui").close();require("dap").clear_breakpoints(); require("dap").terminate()<CR><Cmd>DapVirtualTextForceRefresh<CR>', { noremap = true })
    --vim.keymap.set('n', '<localleader>dc', require('dap').run_to_cursor)
    vim.keymap.set('n', '<localleader>du', require('dap').up)
    vim.keymap.set('n', '<localleader>dd', require('dap').down)
    vim.keymap.set('n', '<localleader>ds', require('dap').step_back)
    vim.keymap.set('n', '<localleader>dn', require('dap').step_over)
    vim.keymap.set('n', '<localleader>di', require('dap').step_into)
    vim.keymap.set('n', '<localleader>do', require('dap').step_out)
    vim.keymap.set('n', '<localleader>dc', require('dap').continue)
    vim.keymap.set('n', '<localleader>dx', function() return require('dapui').float_element('scopes', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<localleader>dw', function() return require('dapui').float_element('watches', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<localleader>db', function() return require('dapui').float_element('stacks', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<localleader>dp', function() return require('dapui').float_element('breakpoints', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<localleader>dr', function() return require('dapui').float_element('repl', { enter = true } ) end, { silent = true })
    vim.api.nvim_set_keymap('n', '<localleader>de', [[<cmd>lua require("dapui").eval()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<localleader>da', [[<cmd>lua require("dapui").eval(vim.fn.input('Enter expression: '))<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<localleader>dk', [[:lua require'dapui'.toggle()<CR>]], {noremap = true, silent = true})
end
