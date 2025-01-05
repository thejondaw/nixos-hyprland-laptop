{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jondaw = {
    isNormalUser = true;
    description = "jondaw";
    extraGroups = [ "networkmanager" "input" "plugdev" "wheel" "video" "audio" "tss" "libvirtd" "kvm" "lpadmin" "wireshark" "wireless" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [

    steam
    lutris

    gnome-calculator
     
    file-roller
      p7zip 
      unrar 
      zip 
      unzip

    gimp
    kdePackages.kdenlive
    spotify
    obs-studio

    keepassxc
    thunderbird
    qbittorrent
     
    discord
    tdesktop

    vscodium
    obsidian
    libreoffice

    floorp
    librewolf
    chromium
    ];
  };

# Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
