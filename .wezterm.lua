local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.enable_tab_bar = false
config.font_size = 16.0
config.font = wezterm.font 'FiraCode Nerd Font'


return config
