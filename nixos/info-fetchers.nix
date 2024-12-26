{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   neofetch            # системная инфа
   onefetch            # инфа о git репе
   ipfetch             # сетевая инфа
   cpufetch            # инфа о процессоре
   ramfetch            # инфа об оперативке

   bottom              # System monitoring
   btop                # System monitoring
   kmon                # Kernel monitoring
   bandwhich           # Network monitoring

   vulkan-tools        # тулзы для vulkan 
#  opencl-info         # инфа OpenCL
#  clinfo              # инфа OpenCL
#  vdpauinfo           # инфа VDPAU
   libva-utils         # тулзы VA-API
#  nvtopPackages.nvidia # мониторинг Nvidia
#  nvtopPackages.intel # мониторинг Intel GPU
   wlr-randr           # управление мониторами
#  gpu-viewer          # инфа о GPU
   dig                 # DNS утилита
   speedtest-rs        # тест скорости
];
}
