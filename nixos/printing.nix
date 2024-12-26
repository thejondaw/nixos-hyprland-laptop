{ pkgs, ... }:

{
  # Enable CUPS to print documents
  services.printing = {
    enable = true;
    drivers = with pkgs; [ 
      brlaser 
      brgenml1cupswrapper
    ];
    defaultShared = true;  # Важно!
    allowFrom = [ "all" ]; # Разрешаем доступ всем
  };
 
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
