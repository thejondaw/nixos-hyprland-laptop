{ config, pkgs, ... }:

{
  home = {
    username = "jondaw";
    homeDirectory = "/home/jondaw";
    stateVersion = "24.11";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}

