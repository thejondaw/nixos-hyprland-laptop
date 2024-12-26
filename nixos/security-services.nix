{ pkgs, lib, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # WireShark
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  # Enable Security Services
  users.users.root.hashedPassword = "!";
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
  security.apparmor = {
    enable = true;
    packages = with pkgs; [
      apparmor-utils
      apparmor-profiles
    ];
  };
  services.fail2ban.enable = true;
  security.pam.services.hyprlock = {};
  security.polkit.enable = true;
  programs.browserpass.enable = true;
  
#  services.clamav = {
#    daemon.enable = true;
#    fangfrisch.enable = true;
#    fangfrisch.interval = "daily";
#    updater.enable = true;
#    updater.interval = "daily"; #man systemd.time
#    updater.frequency = 12;
#  };

  programs.firejail = {
    enable = true;
    wrappedBinaries = { 
      mpv = {
        executable = "${lib.getBin pkgs.mpv}/bin/mpv";
        profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
      };
      imv = {
        executable = "${lib.getBin pkgs.imv}/bin/imv";
        profile = "${pkgs.firejail}/etc/firejail/imv.profile";
      };
      zathura = {
        executable = "${lib.getBin pkgs.zathura}/bin/zathura";
        profile = "${pkgs.firejail}/etc/firejail/zathura.profile";
      };
      discord = {
        executable = "${lib.getBin pkgs.discord}/bin/discord";
        profile = "${pkgs.firejail}/etc/firejail/discord.profile";
      };
      slack = {
        executable = "${lib.getBin pkgs.slack}/bin/slack";
        profile = "${pkgs.firejail}/etc/firejail/slack.profile";
      };
      telegram-desktop = {
        executable = "${lib.getBin pkgs.tdesktop}/bin/telegram-desktop";
        profile = "${pkgs.firejail}/etc/firejail/telegram-desktop.profile";
      };
      floorp = {
        executable = "${lib.getBin pkgs.floorp}/bin/floorp";
        profile = "${pkgs.firejail}/etc/firejail/firefox-esr.profile";
      };
      librewolf = {
        executable = "${lib.getBin pkgs.librewolf}/bin/librewolf";
        profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
      };
      thunar = {
        executable = "${lib.getBin pkgs.xfce.thunar}/bin/thunar";
        profile = "${pkgs.firejail}/etc/firejail/thunar.profile";
      };
      vscodium = {
        executable = "${lib.getBin pkgs.vscodium}/bin/vscodium";
        profile = "${pkgs.firejail}/etc/firejail/vscodium.profile";
      };
      chromium = {
        executable = "${lib.getBin pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium-browser.profile";
      };
      keepassxc = {
        executable = "${lib.getBin pkgs.keepassxc}/bin/keepassxc";
        profile = "${pkgs.firejail}/etc/firejail/keepassxc.profile";
      };
      qbittorrent = {
        executable = "${lib.getBin pkgs.qbittorrent}/bin/qbittorrent";
        profile = "${pkgs.firejail}/etc/firejail/qbittorrent.profile";
      };
      wireshark = {
        executable = "${lib.getBin pkgs.wireshark}/bin/wireshark";
        profile = "${pkgs.firejail}/etc/firejail/wireshark.profile";
      };
      spotify = {
      executable = "${lib.getBin pkgs.spotify}/bin/spotify";
       profile = "${pkgs.firejail}/etc/firejail/spotify.profile";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vulnix       #scan command: vulnix --system
    clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit   #scan command: sudo chkrootkit

    # passphrase2pgp
    pass-wayland
    pass2csv
    passExtensions.pass-tomb
    passExtensions.pass-update
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-audit
    tomb
    pwgen
    pwgen-secure
  ];

  systemd.user.services.hyprland-polkit-agent = {
    description = "Hyprland Polkit Agent";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hypridle}/libexec/hyprland-polkit-agent";
      Restart = "on-failure";
      RestartSec = 1;
    };
  };
}
