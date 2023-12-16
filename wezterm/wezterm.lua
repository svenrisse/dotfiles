local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "OneDark (base16)"
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono Nerd Font", scale = 1.4 },
})
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
