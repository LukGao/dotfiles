return function()
    local Path = require('plenary.path')
    require('cmake').setup({
        cmake_executable = 'cmake',
        save_before_build = true,
        build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
        configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
        on_build_output = nil,
        quickfix = {
            pos = 'botright', -- Where to open quickfix
            height = 10, -- Height of the opened quickfix.
            only_on_error = false, -- Open quickfix window only if target build failed.
        },
        copy_compile_commands = true, -- Copy compile_commands.json to current working directory.
        dap_configuration = {
            type = 'lldb',
            request = 'launch',
            stopOnEntry = true,
        }, -- DAP configuration. By default configured to work with `lldb-vscode`.
        dap_open_command = require('dap').repl.open, 
    })
end
