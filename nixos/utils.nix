{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mold
    gcc
    clang
    lld
    lldb
    musl
    jdk11
    dioxus-cli
    trunk
  ];
}
