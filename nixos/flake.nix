{
  description = "Jon Daw's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      rust-overlay.url = "github:oxalica/rust-overlay";
      wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations.arasaka = nixpkgs.lib.nixosSystem { # isitreal-laptop
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./opengl.nix
        ./fingerprint-scanner.nix
#       ./clamav-scanner.nix
#       ./yubikey.nix
        ./sound.nix
        ./usb.nix
        ./keyboard.nix
        ./time.nix
        ./swap.nix
        ./bootloader.nix
        ./nix-settings.nix
        ./nixpkgs.nix
        ./gc.nix
        ./linux-kernel.nix
        ./screen.nix
#       ./location.nix
        ./display-manager.nix
        ./theme.nix
        ./internationalisation.nix
        ./fonts.nix
        ./security-services.nix
        ./services.nix
        ./printing.nix
        ./hyprland.nix
        ./environment-variables.nix
        ./bluetooth.nix
        ./networking.nix
        ./mac-randomize.nix
        ./open-ssh.nix
#       ./mosh.nix
        ./firewall.nix
        ./dns.nix
        ./vpn.nix
        ./users.nix
        ./virtualisation.nix
        ./programming-languages.nix
        ./lsp.nix
        ./rust.nix
        ./wasm.nix
        ./info-fetchers.nix
        ./utils.nix
        ./terminal-utils.nix
#       ./llm.nix
        ./work.nix
      ];
    };
  };
}