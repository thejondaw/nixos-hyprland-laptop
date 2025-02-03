{ pkgs, ... }:

{
  # Basic system services
  services = {
    # Enable TRIM for NVMe SSD
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  # Hardware configuration and acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      vulkan-loader
      vulkan-tools
      mesa
    ];
  };

  # Kernel configuration
  boot = {
    kernelModules = [ "kvm-intel" ];
  };

  environment = {
    variables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    systemPackages = with pkgs; [ powertop ];
  };
}
