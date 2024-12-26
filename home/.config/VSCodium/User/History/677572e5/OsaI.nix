{ pkgs, ... }:

{
  # Basic system services
  services = {
    # Enable TRIM for SSDs
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    tlp = {
      enable = true;
      settings = {
        # AC power settings
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_MIN_PERF_ON_AC = 35;
        CPU_MAX_PERF_ON_AC = 100;

        # AMD CPU specific optimizations
        CPU_BOOST_ON_AC = 1;
        PLATFORM_PROFILE_ON_AC = "performance";
      };
    };
  };

   # Kernel configuration
  boot = {
    kernelModules = [ "kvm-amd" "amdgpu" ];
    kernelParams = [
      "amdgpu.ppfeaturemask=0xffffffff" # Включаем все возможности управления питанием
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      powertop
      radeontop    # Мониторинг AMD GPU
      corectrl     # Управление AMD CPU/GPU
    ];
  };
}
