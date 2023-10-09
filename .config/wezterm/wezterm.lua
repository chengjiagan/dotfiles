-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- appearance
config.color_scheme = "Tokyo Night Moon"
config.window_decorations = "RESIZE"

-- tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- font
config.font_size = 17
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font_with_fallback({
-- 	"JetBrains Mono NL",
-- 	"Symbols Nerd Font",
-- })

-- and finally, return the configuration to wezterm
return config
