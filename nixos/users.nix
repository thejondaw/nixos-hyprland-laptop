{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jondaw = {
    isNormalUser = true;
    description = "jondaw";
    extraGroups = [ "networkmanager" "input" "plugdev" "wheel" "video" "audio" "tss" "libvirtd" "kvm" "lpadmin" "wireshark" "wireless" ];
    shell = pkgs.fish;
    packages = with pkgs; [

    # Runners & Emulators
    appimage-run
    wineWowPackages.stable
    winetricks
    protonup-qt
    protontricks
    mangohud
    gamescope
    gamemode

    # Games
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

    vscode
    obsidian
    onlyoffice-desktopeditors
    xfce.mousepad
    zed-editor

    floorp
    librewolf
    chromium
    ];
  };


  # Steam - Daemon
  programs.steam = {
    enable = true;
  };

  # AppImage - Daemon
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

# Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
