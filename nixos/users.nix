{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jondaw = {
    isNormalUser = true;
    description = "jondaw";
    extraGroups = [ "networkmanager" "input" "plugdev" "wheel" "video" "audio" "tss" "libvirtd" "kvm" "lpadmin" "wireshark" "wireless" ];
    shell = pkgs.fish;
    packages = with pkgs; [

    # Games
    appimage-run
    wineWowPackages.stable
    winePackages.waylandFull
    winetricks
    steam
    lutris
    heroic

    gnome-calculator
     
    file-roller
      p7zip 
      unrar 
      zip 
      unzip

    gimp
    kdePackages.kdenlive
    obs-studio

    keepassxc
    qbittorrent
     
    discord
    tdesktop
    webex

    vscodium
    obsidian
    onlyoffice-desktopeditors
    xfce.mousepad

    floorp
    librewolf
    chromium
    ];
  };


  # Steam Service
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

# Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
