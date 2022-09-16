local wezterm = require 'wezterm'
local act = wezterm.action
wezterm.on(
"format-tab-title",
function(tab, tabs, panes, config, hover, max_width)
    local symbolic = " ○ "

    if tab.is_active then
        symbolic = "   "
    end

    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    return {
        { Text = symbolic .. (pane.pane_id + 1) .. title .. " " },
    }
end
)
wezterm.on("update-right-status", function(window, pane)
    local datetime = "   " .. wezterm.strftime("%F %H:%M  ")
    local bat = ''
    for _, b in ipairs(wezterm.battery_info()) do
        bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
    end

    window:set_right_status(wezterm.format {
        { Text = bat .. '   ' .. datetime },
    })
end)
return {
    check_for_updates = false,
    color_scheme = "Dracula",
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 16,
    enable_tab_bar = true,
    leader = {key='o', mods='CTRL', timeout_milliseconds=1000},
    keys = {
        { key = 'p', mods = 'ALT', action = wezterm.action.ToggleFullScreen, },
        { key = 'v', mods = 'ALT',          action = act.PasteFrom 'Clipboard' },
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
