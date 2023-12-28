local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrains Mono Nerd Font", { weight = "Regular", italic = false })
config.font_size = 18.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 144

return config
