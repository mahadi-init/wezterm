-- Pull in the WezTerm API
local wezterm = require 'wezterm'

-- Initialize the configuration object
local config = wezterm.config_builder()

-- Remove window decorations (title bar, borders, etc.)
config.window_decorations = 'NONE'

-- Set the color scheme
config.color_scheme = 'Catppuccin Macchiato'

-- initial size
config.initial_rows = 36
config.initial_cols = 112

-- Set the font and font size
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13

-- Configure the window frame (title bar)
config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' }, -- Font for the title bar
  font_size = 12.0, -- Font size for the title bar
  active_titlebar_bg = '#333333', -- Background color for the active window title bar
  inactive_titlebar_bg = '#333333', -- Background color for inactive window title bars
}

-- Configure tab bar colors
config.colors = {
  tab_bar = {
    background = '#000033', -- Background color of the tab bar (matches Deep Space black)
    active_tab = {
      bg_color = '#1C1C3A', -- Background color of the active tab (matches Dark Purple)
      fg_color = '#E0E0E0', -- Light gray text for better contrast
    },
    inactive_tab = {
      bg_color = '#000033', -- Background color of inactive tabs (matches Deep Space black)
      fg_color = '#808080', -- Gray text for inactive tabs
    },
    inactive_tab_hover = {
      bg_color = '#1C1C3A', -- Background color of inactive tabs on hover (matches Dark Purple)
      fg_color = '#C0C0C0', -- Light gray text on hover
      italic = true, -- Italicize text on hover
    },
    inactive_tab_edge = '#4B0082', -- Edge color of inactive tabs (matches Indigo)
    new_tab = {
      bg_color = '#000033', -- Background color of the new tab button (matches Deep Space black)
      fg_color = '#808080', -- Gray text for the new tab button
    },
    new_tab_hover = {
      bg_color = '#1C1C3A', -- Background color of the new tab button on hover (matches Dark Purple)
      fg_color = '#C0C0C0', -- Light gray text on hover
      italic = true, -- Italicize text on hover
    },
  },
}

-- Adjust the appearance of inactive panes
config.inactive_pane_hsb = {
  saturation = 0.9, -- Reduce saturation for inactive panes
  brightness = 0.8, -- Reduce brightness for inactive panes
}

-- Set window padding (no padding in this case)
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Optional: Set a background image (commented out)
config.window_background_image = '/home/mahadi/.config/wezterm/itachi2.jpg'

-- Configure a gradient background for the window
-- config.window_background_gradient = {
--   orientation = 'Horizontal', -- Gradient orientation
--   colors = {
--     '#000033', -- Deep space black
--     '#1C1C3A', -- Dark purple
--     '#4B0082', -- Indigo
--   },
--   interpolation = 'Linear', -- Smooth interpolation
--   blend = 'Rgb', -- Color blending mode
--   -- Optional gradient settings (commented out)
--   -- noise = 64,
--   -- segment_size = 11,
--   -- segment_smoothness = 0.0,
--   -- preset = "Warm",
-- }

-- Adjust the HSB (Hue, Saturation, Brightness) of the background image
config.window_background_image_hsb = {
  brightness = 0.5, -- Reduce brightness
  -- hue = 1, -- Hue adjustment
  -- saturation = 1.2, -- Saturation adjustment
}

-- Set the opacity of the text background
config.text_background_opacity = 1

-- Return the final configuration to WezTerm
return config
