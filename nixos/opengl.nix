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
      mesa.drivers             # Основные драйверы
      vulkan-loader            # Vulkan
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
