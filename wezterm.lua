local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

-- General Settings
config.color_scheme = 'Catppuccin Mocha' -- or "Dracula", "Gruvbox Dark", "Tokyo Night"
config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono', weight = 'Medium' },
  { family = 'Fira Code', weight = 'Regular' }, -- Fallback font
  'Noto Color Emoji', -- For emoji support
}
config.font_size = 13
config.line_height = 1.1
config.cell_width = 1.0 -- Slightly more condensed text

-- Window Appearance
config.initial_rows = 36
config.initial_cols = 112
config.window_decorations = 'RESIZE' -- "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 12,
  bottom = 2,
}
config.window_background_opacity = 0.92 -- Slight transparency
config.text_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

-- Tab Bar Customization
config.use_fancy_tab_bar = false -- Simpler, more compact tabs
config.tab_bar_at_bottom = true -- Tabs at the bottom
config.show_tab_index_in_tab_bar = true -- Show tab numbers (e.g., "1: zsh")
config.show_new_tab_button_in_tab_bar = false -- Hide the "+" button

-- Tab Styling (matches Catppuccin Mocha)
config.colors = {
  tab_bar = {
    background = '#1E1E2E', -- Base background
    active_tab = {
      bg_color = '#585B70',
      fg_color = '#CDD6F4',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#181825',
      fg_color = '#7F849C',
    },
    inactive_tab_hover = {
      bg_color = '#313244',
      fg_color = '#CDD6F4',
    },
    new_tab = {
      bg_color = '#1E1E2E',
      fg_color = '#7F849C',
    },
  },
}

-- Tab Title Format (shows relative path + shell)
wezterm.on('format-tab-title', function(tab)
  local title = tab.active_pane.title
  local cwd = title:gsub('^.*/([^/]+)/?$', '%1') -- Extract last dir
  local process = tab.active_pane.foreground_process_name
  local shell = process and process:match '([^/]+)$' or ''

  return string.format(' %s ➤ %s ', cwd, shell) -- e.g., " projects ➤ zsh "
end)

-- Status Bar (Right Side)
wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%H:%M %a %d-%b' -- "14:30 Mon 10-Apr"
  local battery = wezterm.battery_info()[1] or { state_of_charge = 0 }
  local bat_icon = battery.state == 'Charging' and '⚡' or '🔋'
  local bat_percent = math.floor(battery.state_of_charge * 100)

  window:set_right_status(wezterm.format {
    { Foreground = { Color = '#89B4FA' } }, -- Light blue
    { Text = bat_icon .. ' ' .. bat_percent .. '%  ' },
    { Foreground = { Color = '#F5E0DC' } }, -- Peach
    { Text = date },
  })
end)

-- Keybindings
config.keys = {
  -- Split panes
  { key = '|', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- Tab navigation
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  -- Copy/Paste
  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  -- Font size adjustments
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
}

-- Mouse & Cursor
config.default_cursor_style = 'BlinkingBar' -- "SteadyBlock", "BlinkingUnderline"
config.cursor_blink_rate = 500 -- Blink speed (ms)
config.enable_scroll_bar = true
config.scrollback_lines = 5000 -- More scrollback history
config.mouse_bindings = {
  -- Ctrl+Click opens links
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
}

return config
