local wezterm = require 'wezterm';

return {
  color_scheme = "Tomorrow Night Bright",
  font = wezterm.font("Iosevka Term", { weight = "Medium" }),
  tab_bar_at_bottom = false,
  font_size = 16,
  scrollback_lines = 8500,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  window_padding = {
    left = 4,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    -- Tab
    {key="w", mods="CMD|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},

    -- Pane
    {key="-", mods="CMD", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="/", mods="CMD", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="w", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=true}}},

    -- Movement
    {key="j", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="k", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="h", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="l", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
  }
}
