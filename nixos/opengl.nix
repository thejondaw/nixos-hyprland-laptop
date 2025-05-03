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
    extraPackages = with pkgs; [
      intel-media-driver       # VA-API для видео
      intel-compute-runtime    # OpenCL/Vulkan для Intel
      mesa                     # Основные драйверы (mesa.drivers)
      vulkan-loader            # Vulkan
      vulkan-tools
      vulkan-validation-layers
      dxvk
      vkd3d-proton
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
    systemPackages = with pkgs; [ 
      powertop
      ];
    };
}
