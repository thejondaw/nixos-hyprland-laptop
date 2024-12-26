{ pkgs, ... }:

{
  # USB Automounting
  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  services.usbguard = {
    enable = true;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    rules = ''
      # Встроенные устройства
      allow id 27c6:6594 serial "UID199A0888_XXXX_MOC_B0" name "Goodix USB2.0 MISC" with-interface ff:00:00 # Сканер отпечатков Goodix
      allow id 30c9:0050 # Камера
      allow id 8087:0033 # Bluetooth
      allow id 1d6b:0002 # USB 2.0 хабы
      allow id 1d6b:0003 # USB 3.0 хабы

      # Накопители
      allow id 058f:6387 # Alcor Micro Flash Drive
      allow id 0781:5581 # SanDisk Ultra
      allow id 054c:0243 # Sony MicroVault
      allow id 05dc:c75c # Lexar JumpDrive
      allow id 048d:1165 # ITE Tech Flash

      # USB хабы
      allow id 1a40:0801 # Terminus USB 2.0 Hub

      # Периферия
      allow id 046d:c52f # Logitech Nano Receiver
      allow id 047f:02ee # Plantronics BT600
      allow id 046d:0ab5 # Logitech G733
      allow id 28bd:0905 # XP-Pen Tablet
      allow id 05ac:12a8 # iPhone
      '';
    };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
