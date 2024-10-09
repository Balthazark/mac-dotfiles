local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decoration = "RESIZE",
    default_cursor_style = "BlinkingBar",
    color_scheme = "Catppuccin Mocha",
    font = wezterm.font("JetBrains Mono", {weigth = "Bold"}),
    font_size = 12.5,
}

return config
