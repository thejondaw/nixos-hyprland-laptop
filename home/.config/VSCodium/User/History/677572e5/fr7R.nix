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

  # Cooling configuration for AMD
  services.thermald.enable = false; # Not needed for AMD

  services.amdgpu-fan = {
    enable = true;
    settings = {
      speed_matrix = [
        [ 0    0   40] # Below 40°C - fans off
        [ 1   40   50] # 40-50°C - minimal speed
        [ 30  50   60] # 50-60°C - 30%
        [ 45  60   70] # 60-70°C - 45%
        [ 60  70   75] # 70-75°C - 60%
        [ 80  75   80] # 75-80°C - 80%
        [ 100 80  100] # Above 80°C - full speed
      ];
    };
  };

  # Hardware configuration and acceleration
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
    };

    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
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
