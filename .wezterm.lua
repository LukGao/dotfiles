local wezterm = require 'wezterm'

local format_tab_title = function(tab, tabs, panes, config, hover, max_width)
    local symbolic = " ○ "
    if tab.is_active then
        symbolic = "   "
    end
    local title = tab.active_pane.title
    return { { Text = symbolic .. title .. " " } }
end


local format_windos_title = function(tab, pane, tabs, panes, config)
    local datetime = wezterm.strftime("%F %H:%M")
    return tab.active_pane.title .. " | " .. datetime
end

wezterm.on('format-window-title', format_windos_title)

wezterm.on("format-tab-title", format_tab_title)

local key_binddings = {
    { key = 'p', mods = 'ALT', action = wezterm.action.ToggleFullScreen, },
    { key = 'v', mods = 'ALT', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = "t", mods = "ALT", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    -- { key = 'o', mods = 'LEADER|CTRL', action = wezterm.action.SendString '\x0f', },
}


for i = 1, 9 do
    table.insert(key_binddings, {
        key = tostring(i),
        mods = 'ALT',
        action = wezterm.action.ActivateTab(i - 1),
    })
    table.insert(key_binddings, {
        key = tostring(i),
        mods = 'LEADER',
        action = wezterm.action.MoveTab(i - 1),
    })
end
table.insert(key_binddings, {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
})
table.insert(key_binddings, {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
})
table.insert(key_binddings, {
    key = 'h', --左侧的分屏窗口
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
})
table.insert(key_binddings, {
    key = 'l', --左侧的分屏窗口
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
})

table.insert(key_binddings, {
    key = 'k', -- 上侧的分屏窗口
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
})

table.insert(key_binddings, {
    key = 'j', -- 下侧的分屏窗口
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
})
mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action { CompleteSelection = "Clipboard" }
    },
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = "OpenLinkAtMouseCursor"
    }
}

return {
    check_for_updates = false,
    color_scheme = "Dracula",
    -- font = wezterm.font("Ubuntu Nerd Font"),
    font_size = 18,
    -- window_decorations = "NONE",
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
    adjust_window_size_when_changing_font_size = false,
    leader = { key = 'o', mods = 'ALT', timeout_milliseconds = 500 },
    keys = key_binddings,
    mouse_bindings = mouse_bindings,
}
