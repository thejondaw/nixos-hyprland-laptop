{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alexsuff = {
    isNormalUser = true;
    description = "alexsuff";
    extraGroups = [ "networkmanager" "input" "plugdev" "wheel" "video" "audio" "tss" "libvirtd" "kvm" "lpadmin" ];
    shell = pkgs.fish;
    packages = with pkgs; [

    gnome-calculator

    file-roller
      p7zip
      unrar
      zip
      unzip

    gimp

    keepassxc
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


  services.snapper = {
    snapshotInterval = "2h";            # как часто делать бэкапы
    configs = {
      home = {
        ALLOW_USERS = [ "alexsuff" ];
        SUBVOLUME = "/home";
        TIMELINE_CREATE = true;         # включаем автобэкапы
        TIMELINE_CLEANUP = true;        # включаем автоочистку
        TIMELINE_MIN_AGE = "1800";      # не удалять файлы младше 30 минут

        # сколько бэкапов храним:
        TIMELINE_LIMIT_HOURLY = "3";    # за последние часы
        TIMELINE_LIMIT_DAILY = "7";     # за последние дни
        TIMELINE_LIMIT_WEEKLY = "2";    # за последние недели
        TIMELINE_LIMIT_MONTHLY = "2";   # за последние месяцы
        TIMELINE_LIMIT_YEARLY = "0";    # за последние годы (нахуй не надо)
      };
    };
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
