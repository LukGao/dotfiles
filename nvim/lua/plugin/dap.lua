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


    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '' })

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
    vim.keymap.set('n', '<M-b>', require('dap').toggle_breakpoint)
    vim.keymap.set('n', '<M-n>', require('dap').step_over)
    vim.keymap.set('n', '<M-i>', require('dap').step_into)
    vim.keymap.set('n', '<M-o>', require('dap').step_out)
    vim.keymap.set('n', '<M-c>', require('dap').continue)
    vim.keymap.set('n', '<M-x>', function() return require('dapui').float_element('scopes', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<M-w>', function() return require('dapui').float_element('watches', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<M-s>', function() return require('dapui').float_element('stacks', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<M-p>', function() return require('dapui').float_element('breakpoints', { enter = true } ) end, { silent = true })
    vim.keymap.set('n', '<M-r>', function() return require('dapui').float_element('repl', { enter = true } ) end, { silent = true })
    vim.api.nvim_set_keymap('n', '<M-e>', [[<cmd>lua require("dapui").eval()<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<M-a>', [[<cmd>lua require("dapui").eval(vim.fn.input('Enter expression: '))<CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<M-k>', [[:lua require'dapui'.toggle()<CR>]], {noremap = true, silent = true})
end
