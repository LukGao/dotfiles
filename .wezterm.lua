local wezterm = require 'wezterm'
local hostname = wezterm.hostname()

local format_tab_title = function(tab, tabs, panes, config, hover, max_width)

    local symbolic = " ○ "
    if tab.is_active then
        symbolic = "   "
    end

    local title = tab.active_pane.title

    return { { Text = symbolic .. title .. " " } }
end

local update_right_status = function(window, pane)

    local cwd = " " ..pane:get_current_working_dir():sub(8).." "

    local hostname = " "..wezterm.hostname().." "

    local datetime = "   " .. wezterm.strftime("%F %H:%M  ")

    local bat = ''
    for _, b in ipairs(wezterm.battery_info()) do
        bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
    end

    window:set_right_status(wezterm.format { { Text = bat .. '    ' .. datetime .. ' | ' .. hostname ..' '}, })
end

local format_windos_title = function(tab, pane, tabs, panes, config)

    local index = tab.tab_index + 1

    return tab.active_pane.title .. " | " .. hostname
end

wezterm.on('format-window-title',format_windos_title )

wezterm.on("format-tab-title",format_tab_title)

wezterm.on("update-right-status",update_right_status)

return {
    check_for_updates = false,
    color_scheme = "Dracula",
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 16,
    window_decorations = "NONE",
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
    adjust_window_size_when_changing_font_size = false,
    leader = {key='o', mods='CTRL', timeout_milliseconds=1000},
    keys = {
        { key = 'o', mods = 'LEADER|CTRL', action = wezterm.action.SendString '\x0f', },
        { key = 'p', mods = 'ALT', action = wezterm.action.ToggleFullScreen, },
        { key = 'v', mods = 'ALT',          action = wezterm.action.PasteFrom 'Clipboard' },
        { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
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
