{
  description = "Jon Daw's NixOS Configuration";

  inputs = {
      nixpkgs.url          = "github:NixOS/nixpkgs/nixos-24.11";
#     nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
      rust-overlay.url     = "github:oxalica/rust-overlay";
      wezterm.url          = "github:wez/wezterm?dir=nix";
      
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {

    nixosConfigurations.arasaka = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.users.jondaw    = import ./home-manager/jondaw;
        }
        ./configuration.nix
        ./hardware-configuration.nix

#       ./auto-upgrade.nix
        ./bluetooth.nix
        ./bootloader.nix
#       ./clamav-scanner.nix
        ./display-manager.nix
        ./dns.nix
        ./environment-variables.nix
        ./fingerprint-scanner.nix
        ./firewall.nix
        ./fonts.nix
        ./gc.nix
        ./hyprland.nix
        ./info-fetchers.nix
        ./internationalisation.nix
        ./keyboard.nix
        ./linux-kernel.nix
#       ./llm.nix
#       ./location.nix
        ./lsp.nix
        ./mac-randomize.nix
        ./networking.nix
#       ./mosh.nix
        ./nix-settings.nix
        ./nixpkgs.nix
        ./open-ssh.nix
        ./opengl.nix
        ./printing.nix
        ./programming-languages.nix
        ./rust.nix
        ./screen.nix
        ./security-services.nix
        ./services.nix
        ./sound.nix
        ./swap.nix
        ./terminal-utils.nix
        ./theme.nix
        ./time.nix
        ./usb.nix
        ./users.nix
        ./utils.nix
        ./virtualisation.nix
        ./vpn.nix
        ./wasm.nix
        ./work.nix
#       ./yubikey.nix
      ];
    };
  };
}

