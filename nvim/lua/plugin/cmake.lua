return function()
    require('cmake').setup({
        configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
        dap_open_command = require('dapui').open,
    })
end
