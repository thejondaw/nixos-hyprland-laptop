{ inputs, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
#   hyprpaper
    swww
    waypaper

    inputs.wezterm.packages.${pkgs.system}.default
#   cool-retro-term

    starship
#   helix
    neovim

#   qutebrowser
    zathura
    mpv
    imv
  ];
}