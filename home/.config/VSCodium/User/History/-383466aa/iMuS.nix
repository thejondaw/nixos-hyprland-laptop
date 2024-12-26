{ pkgs, ... }:

{
  # Enable Containerd
  # virtualisation.containerd.enable = true;

  # Enable Docker
  # virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
  # users.extraGroups.docker.members = [ "alexsuff" ];

  # Enable Podman
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      dockerSocket.enable = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  environment.variables.DBX_CONTAINER_MANAGER = "podman";
  users.extraGroups.podman.members = [ "alexsuff" ];

  environment.systemPackages = with pkgs; [
    # nerdctl

    # firecracker
    # firectl
    # flintlock

    distrobox
    boxbuddy
    qemu

    podman-compose
    podman-tui

    docker-compose
    lazydocker
    # docker-credential-helpers

    virt-manager
    virt-viewer
    spice-gtk
    win-virtio
    swtpm
  ];

  # Virt-Manager + QEMU/KVM
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [(pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          })];
        };
      };
    };
  };

}
