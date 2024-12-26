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
    hyprpaper
    waypaper

    inputs.wezterm.packages.${pkgs.system}.default

    starship
    neovim

    mpv
    imv
  ];
}
