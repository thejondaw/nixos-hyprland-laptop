local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.font_size = 18.0
config.enable_wayland = true
config.prefer_egl = true
config.front_end = "OpenGL"
config.color_scheme = 'Catppuccin Macchiato'
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.tab_bar_style = {
  new_tab = "  +  ",
  new_tab_hover = "  +  ",
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}

config.background = {
  {
    source = {
      Color = "#24273a"
    },
    height = "100%",
    width = "100%",
  },
  {
    source = {
      File = '',
    },
    opacity = 0.02,
    vertical_align = "Middle",
    horizontal_align = "Center",
    height = "1824",
    width = "2724",
    repeat_y = "NoRepeat",
    repeat_x = "NoRepeat",
  },
}

config.launch_menu = {
  {
    args = { 'btop' },
  },
  {
    args = { 'cmatrix' },
  },
  {
    args = { 'pipes-rs' },
  },
}

config.keys = {
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
}

return config
