{
 disko.devices = {
   disk = {
     sda = {
       type = "disk";
       device = "/dev/sda";
       content = {
         type = "gpt";
         partitions = {
           ESP = {
             name = "boot";
             size = "2G";
             type = "EF00";
             content = {
               type = "filesystem";
               format = "vfat";
               mountpoint = "/boot";
               mountOptions = ["umask=0077"];
             };
           };

           swap = {
             name = "swap";
             size = "20G";
             content = {
               type = "swap";
             };
           };

           luks = {
             name = "cryptroot";
             size = "100%";
             content = {
               type = "luks";
               name = "crypted";
               settings = {
                 allowDiscards = true;
                 pbkdf = "argon2id";
                 iterations = 16;
                 memoryKiB = 524288;
               };
               passwordFile = "/tmp/secret.key";

               content = {
                 type = "btrfs";
                 extraArgs = [ "-f" ];
                 subvolumes = {
                   "@" = {
                     mountpoint = "/";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@nix" = {
                     mountpoint = "/nix";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@var" = {
                     mountpoint = "/var";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@varlog" = {
                     mountpoint = "/var/log";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@home" = {
                     mountpoint = "/home";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@snapshots" = {
                     mountpoint = "/.snapshots";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                   "@cache" = {
                     mountpoint = "/var/cache";
                     mountOptions = [
                       "compress-force=zstd:2"
                       "noatime"
                       "space_cache=v2"
                       "ssd_spread"
                       "discard=async"
                       "commit=60"
                     ];
                   };
                 };
               };
             };
           };
         };
       };
     };
   };
 };
}
