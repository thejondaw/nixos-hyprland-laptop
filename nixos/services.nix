{ pkgs, ... }:

{
  # Systemd services setup
  systemd.packages = with pkgs; [
    auto-cpufreq
  ];

  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never"; # auto
    };
    charger = {
      governor = "powersave"; # balance_performance
      turbo = "never"; # auto
    };
  };

  # Enable Services
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      xfce.xfconf
      gnome2.GConf
    ];
  };
  services.mpd.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.tumbler.enable = true; 
  services.fwupd.enable = true;
  services.auto-cpufreq.enable = true;
  # services.gnome.core-shell.enable = true;
  # services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  environment.systemPackages = with pkgs; [
    at-spi2-atk
    qt6.qtwayland
    psi-notify
    poweralertd
    playerctl
    psmisc
    grim
    slurp
    imagemagick
    swappy
    ffmpeg_6-full
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    cliphist
    xdg-utils
    wtype
    wlrctl
    waybar
    rofi-wayland
    dunst
    avizo
    wlogout
    gifsicle
    snapper
    libinput
  ];

  # BTRFS Snapshots  
  services.snapper = {
    snapshotInterval = "2h";            # как часто делать бэкапы
    configs = {
      home = {
        ALLOW_USERS = [ "jondaw" ];
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
}
