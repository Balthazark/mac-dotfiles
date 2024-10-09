local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    default_cursor_style = "BlinkingBar",
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font("JetBrains Mono", {weight = "Bold"}),
    font_size = 13,
    keys = {
		{
			key = 'f',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
  },
  window_frame = {
    inactive_titlebar_bg = '#11111b',
    active_titlebar_bg = '#11111b',
  },
  colors = {
  tab_bar = {
      background = '#11111b',
      active_tab = {
          bg_color = '#1e1e2e',
          fg_color = '#c0c0c0',
          intensity = 'Normal',
          underline = 'None',
          italic = false,
          strikethrough = false,
      },
      inactive_tab = {
          bg_color = '#11111b',
          fg_color = '#808080',
      },
      inactive_tab_hover = {
          bg_color = '#45475a',
          fg_color = '#909090',
          italic = true,
      },
      new_tab = {
          bg_color = '#1e1e2e',
          fg_color = '#808080',
      },
      new_tab_hover = {
          bg_color = '#45475a',
          fg_color = '#909090',
          italic = true,
      },
      inactive_tab_edge = "#11111b",
  },
},
}

return config
