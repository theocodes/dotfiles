local wezterm = require 'wezterm';

local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = ' ' .. basename(pane.current_working_dir) .. ' '

    return {
      { Text = title },
    }
  end
)

return {
  color_scheme = "Tomorrow Night Bright",
  -- font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Regular" }),
  font = wezterm.font("Iosevka Nerd Font", { weight = "Regular" }),
  tab_bar_at_bottom = true,
  font_size = 16,
  scrollback_lines = 9500,
  use_fancy_tab_bar = false,
  tab_max_width = 30,
  window_decorations = "RESIZE",
  window_padding = {
    left = 4,
    right = 0,
    top = 0,
    bottom = 0,
  },
  colors = {
      tab_bar = {
        background = 'black',
        active_tab = { fg_color = 'white', bg_color = '#5bc8af', intensity = 'Bold' },
        inactive_tab = { bg_color = 'black', fg_color = 'white' },
      },
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

    -- Alt+x as M+x
    {key="x", mods="ALT", action=wezterm.action{SendString="\x1bx"}},
    {key="x", mods="CMD", action=wezterm.action{SendString="\x1bx"}},
  }
}
