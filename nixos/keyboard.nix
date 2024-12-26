{ pkgs, ... }:

{
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";
  };
}
