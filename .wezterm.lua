local wezterm = require 'wezterm'
local act = wezterm.action
return {
    color_scheme = "Dracula",
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 16,
    enable_tab_bar = false,
    keys = {
        -- paste from the clipboard
        { key = 'v', mods = 'ALT',         action = act.PasteFrom 'Clipboard' },
    },
    mouse_bindings = {
        {
            event = {Down = {streak = 1, button = "Right"}},
            mods = "NONE",
            action = wezterm.action {PasteFrom = "Clipboard"}
        },
        {
            event = {Up = {streak = 1, button = "Left"}},
            mods = "NONE",
            action = wezterm.action {CompleteSelection = "Clipboard"}
        },
        {
            event = {Up = {streak = 1, button = "Left"}},
            mods = "CTRL",
            action = "OpenLinkAtMouseCursor"
        }
    },
}
