{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wasmedge
    wasmer
    wasmi
  ];
}
