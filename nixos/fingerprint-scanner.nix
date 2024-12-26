{ pkgs, ... }:

{

  # Enable fingerprint scanner
  services.fprintd = {
    enable = true;
    package = pkgs.fprintd-tod;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix;
    };
  };

  security.pam.services = {
    greetd.fprintAuth = true;
    sudo.fprintAuth = true;
    hyprlock.fprintAuth = true;
    login.fprintAuth = true;
  };

}
