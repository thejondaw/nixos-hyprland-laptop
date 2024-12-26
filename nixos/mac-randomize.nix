{ pkgs, ... }:

{
  # When connecting to untrusted networks, such as public Wi-Fi use a random MAC address to prevent tracking and unauthorized access to your device.
  # But my recommendation is to avoid untrusted networks whenever possible, opting for trusted home or mobile hotspot connections.
  # Also, you can enhance your privacy and security by:
    # - Employing a VPN (Virtual Private Network) to encrypt internet traffic.
    # - Utilizing Encrypted DNS, with DNS over HTTPS (DoH) to encrypt communication with the DNS server and mask DNS traffic under HTTPS.

  # Enable MAC Randomize
  systemd.services.macchanger = {
    enable = true;
    description = "Change MAC address";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "iwd.service" ];
    before = [ "network-online.target" ];
    wants = [ "iwd.service" ];
    
    serviceConfig = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.iproute2}/bin/ip link set wlan0 down";
      ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlan0";
      ExecStartPost = "${pkgs.iproute2}/bin/ip link set wlan0 up";
      ExecStop = [
        "${pkgs.iproute2}/bin/ip link set wlan0 down"
        "${pkgs.macchanger}/bin/macchanger -p wlan0"
        "${pkgs.iproute2}/bin/ip link set wlan0 up"
      ];
      Restart = "on-failure";
      RestartSec = "5s";
      RemainAfterExit = true;
    };
  };

}
