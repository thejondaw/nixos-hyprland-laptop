local wezterm = require 'wezterm'
local act = wezterm.action
local gpus = wezterm.gui.enumerate_gpus()

font_size = 18.0
window_scaling_factor = 2.0

return {
  enable_wayland = true,
  prefer_egl = true,
  front_end = "OpenGL",
  color_scheme = 'Catppuccin Macchiato',
  enable_tab_bar = true,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.7,
  },

  -- enable_scroll_bar = true,
  background = {
    {
      source = {
        Color="#24273a"
      },
      height = "100%",
      width = "100%",
    },
    {
      source = {
        File = '.config/wezterm/lain.gif',
      },
      opacity = 0.02,
      vertical_align = "Middle",
      horizontal_align = "Center",
      height = "1824",
      width = "2724",
      repeat_y = "NoRepeat",
      repeat_x = "NoRepeat",
    },
  },
  launch_menu = {
    {
      args = { 'btop' },
    },
    {
      args = { 'cmatrix' },
    },
    {
      args = { 'pipes-rs' },
    },
  },
  keys = {
    {
      key = 'j',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByPage(1)
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByPage(-1)
    },
    {
      key = 'g',
      mods = 'CTRL|SHIFT',
      action = act.ScrollToTop
    },
    {
      key = 'e',
      mods = 'CTRL|SHIFT',
      action = act.ScrollToBottom
    },
    {
      key = 'p',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.PaneSelect
    },
    {
      key = 'o',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.PaneSelect { mode = "SwapWithActive" }
    },
    {
      key = '%',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      key = '"',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.AdjustPaneSize { 'Left', 1 }
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.AdjustPaneSize { 'Right', 1 }
    },
    {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.AdjustPaneSize { 'Up', 1 }
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.AdjustPaneSize { 'Down', 1 }
    },
    {
      key = 'h',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.ActivatePaneDirection 'Left'
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.ActivatePaneDirection 'Right'
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.ActivatePaneDirection 'Up'
    },
    {
      key = 'j',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.ActivatePaneDirection 'Down'
    },
    {
      key = 'z',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.TogglePaneZoomState
    },
    {
      key = 'q',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.CloseCurrentPane { confirm = true }
    },
    {
      key = 'b',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.RotatePanes 'CounterClockwise'
    },
    {
      key = 'n',
      mods = 'CTRL|SHIFT|SUPER',
      action = act.RotatePanes 'Clockwise'
    },
    {
      key = 'd',
      mods = 'CTRL|SHIFT',
      action = act.ShowLauncher
    },
    {
      key = ':',
      mods = 'CTRL|SHIFT',
      action = act.ClearSelection
    },
  },
}