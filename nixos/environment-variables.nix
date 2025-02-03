{ pkgs, ... }:

{
  # Setup Env Variables
  environment.variables = {
    SPOTIFY_PATH = "${pkgs.spotify}/";
    JDK_PATH = "${pkgs.jdk11}/";
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/intel_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/intel_hasvk_icd.x86_64.json:/run/opengl-driver/share/vulkan/icd.d/lvp_icd.x86_64.json";
  };
}
