local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_rows = 36
config.initial_cols = 112
config.color_scheme = 'Catppuccin Mocha'

config.font_size = 13
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })

config.colors = {
  tab_bar = {
    background = '#2C5364',
    active_tab = {
      bg_color = '#0F2027',
      fg_color = '#E0E0E0',
    },
    inactive_tab_edge = '#4B0082',
  },
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.color_scheme = 'Catppuccin Mocha'

config.text_background_opacity = 1
return config
