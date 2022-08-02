return function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.adapters.lldb = {
        type = 'executable',
        attach = {
            pidProperty = 'pid',
            pidSelect = 'ask',
        },
        command = 'lldb-vscode',
        name = 'lldb',
    }

    dapui.setup({
        layouts = {
            {
                elements = {
                    'scopes',
                    'breakpoints',
                    'stacks',
                    'watches',
                },
                size = 40,
                position = 'right',
            },
            {
                elements = {
                    'repl',
                    'console',
                },
                size = 10,
                position = 'bottom',
            },
        },
    })

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '' })

    vim.keymap.set({ 'n', 'i', 'v' }, '<F10>', dap.step_over, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<F11>', dap.step_into, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<S-F11>', dap.step_out, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<F12>', dap.continue, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<S-F12>', dap.pause, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-d>', dapui.toggle, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-BS>', function()
        dapui.close()
        dap.terminate()
    end, { noremap = true })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-l>', dapui.eval, { noremap = true })

    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { noremap = true })
    vim.keymap.set('n', '<Leader>B', function()
        vim.ui.input({ prompt = 'Breakpoint condition: ' }, function(condition) dap.set_breakpoint(condition) end)
    end, { noremap = true })
    vim.keymap.set('n', '<Leader>lp', function()
        vim.ui.input({ prompt = 'Log point message: ' }, function(message) dap.set_breakpoint(message) end)
    end, { noremap = true })

    vim.api.nvim_create_user_command('Lldb', function(command)
        local config = {
            type = 'lldb',
            name = command.fargs[1],
            request = 'launch',
            program = command.fargs[1],
            args = { vim.list_slice(command.fargs, 2, vim.tbl_count(command.fargs)) },
        }

        dap.run(config)
        dap.repl.open()
    end, { nargs = '+', complete = 'file', desc = 'Start debugging' })
end
