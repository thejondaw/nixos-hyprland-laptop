local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.font_size = 16.0
config.enable_wayland = true
config.prefer_egl = true
config.front_end = "OpenGL"
config.color_scheme = 'Catppuccin Macchiato'
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'

config.tab_bar_style = {
  new_tab = "  +  ",
  new_tab_hover = "  +  ",
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.7,
}● fwupd.service - Firmware update daemon
     Loaded: loaded (/etc/systemd/system/fwupd.service; linked; preset: ignored)
     Active: active (running) since Sun 2024-12-22 22:09:50 CST; 13h ago
 Invocation: b691117977f34f5ea0077aabe26d28e1
       Docs: https://fwupd.org/
   Main PID: 199862 (.fwupd-wrapped)
         IP: 0B in, 0B out
         IO: 39.8M read, 848K written
      Tasks: 4 (limit: 37891)
     Memory: 34.4M (peak: 36.7M)
        CPU: 2.665s
     CGroup: /system.slice/fwupd.service
             └─199862 /nix/store/41ss7m4vs7sjfbpw3s6zmg5mql237yy6-fwupd-2.0.3/libexec/fwupd/fwupd

Dec 22 22:09:48 arasaka systemd[1]: Starting Firmware update daemon...
Dec 22 22:09:50 arasaka fwupd[199862]: 04:09:50.256 FuPluginDfu          failed to parse interface data: no image idx 33 found in firmware
Dec 22 22:09:50 arasaka fwupd[199862]: 04:09:50.256 FuPluginDfu          DFU version 0x0000 invalid, v1.1 assumed
Dec 22 22:09:50 arasaka fwupd[199862]: 04:09:50.361 FuMain               Daemon ready for requests (locale en_US.UTF-8)
Dec 22 22:09:50 arasaka systemd[1]: Started Firmware update daemon.

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
