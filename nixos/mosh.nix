{ pkgs, ... }:

{
  programs.mosh = {
    enable = true;
    #programs.mosh.openFirewall = false;
  };

  environment.systemPackages = with pkgs; [
    mosh
  ];
}
