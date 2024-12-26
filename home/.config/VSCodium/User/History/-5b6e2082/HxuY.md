## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files.

   🚨 Ensure that you configure USBGuard in the `nixos/usb.nix` file to avoid potential issues. By default, USBGuard blocks all USB devices, which can lead to the disabling of crucial hardware components such as the integrated camera, bluetooth, wifi, etc. To configure USBGuard properly, add your trusted USB devices to the configuration. You can obtain a list of all connected devices by using the `lsusb` command from the `usbutils` package.

    Failure to configure USBGuard appropriately may result in the inability to connect any USB devices to your machine. If needed, you can also disable USBGuard altogether by setting `services.usbguard.enable` to `false` in the configuration:`services.usbguard.enable = false;`. This step ensures that USBGuard is not actively blocking any USB devices.

   🚨 Also, important: If you use disk encryption with LUKS and want to use encrypted swap, you need to enable swap on LUKS. This is usually auto-generated in `/etc/nixos/configuration.nix` as the `boot.initrd.luks.devices."luks-...".device = "/dev/disk/by-uuid/...";` code block, if you set this option up during the NixOS installation process. You can simply copy this snippet to either `nixos/swap.nix`, `nixos/hardware-configuration.nix`, or `nixos/configuration.nix` (Personally, I prefer to copy it to `hardware-configuration.nix`).

   Alternatively, you can set it up manually or use [swap encryption with a random key](https://nixos.wiki/wiki/Swap#Encrypt_swap_with_random_key).

4. To change the default username and/or hostname, run the command `rg --hidden 'alexsuff'` to find and fix all instances of the username, and `rg --hidden 'militech'` for the hostname. 🚨 Make sure to change the username to match yours set during installation to avoid login issues. 🚨 Also, don't forget to delete or change to yours the git settings in `home/.gitconfig`, `home/projects/.gitconfig.personal`, and `home/work/.gitconfig.work` files, as they are configured for my personal use.
5. Enable `flake` support (more [here](https://nixos.wiki/wiki/Flakes#Enable_flakes_temporarily)) on your current system. Don't forget to run `sudo nixos-rebuild switch` after enabling `flake` in your `/etc/configuration.nix`.
6. Copy or move all files (with replacements) from the `home` directory to your `$HOME` directory in Linux.
7. Copy or move all files (with replacements and **sudo** permissions) from the `nixos` directory to `/etc/nixos/`. 🚨 Ensure that `system.stateVersion = "your_version";` is correctly set to the release version of the initial installation of your system in the `configuration.nix` file. 🚨 Also, for security reasons, ensure all files in the `/etc/nixos` directory are owned by **root**. If not, change ownership using the command: `sudo chown -R root:root /etc/nixos`.
8. Run the command `sudo nixos-rebuild switch --flake /etc/nixos#your-hostname --update-input nixpkgs --update-input rust-overlay --commit-lock-file --upgrade` or `nswitchu`. If you chose first command, replace `your-hostname` with your hostname before running the command; by default, hostname is set to `isitreal-laptop`.
9. Post-installation configuration:

 - Import GNOME settings along with the theme by executing the following command: `dconf load / < home/.config/gnome_settings_backup.dconf`. Additionally, you can use tools like **gnome-tweaks** or **themechanger** to fine-tune specific theme preferences to your liking.

 - Install dictionaries for spellchecking in Qutebrowser by using the similar command in **bash**: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) install en-US hi-IN`.
  To obtain a list of all available dictionaries, run: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) list` in **bash**.
  For more information, visit [the Qutebrowser page on the nixos wiki](https://wiki.nixos.org/wiki/Qutebrowser).

 - Apply Catppuccin theme for websites in your browser (Brave, Firefox, Chromium):
   - Install the Stylus Extension from its [official website](https://add0n.com/stylus.html).
   - Open the extension's settings page and navigate to the Backup section.
   - Click "Import" and select the file `home/.config/stylus-catppuccin.json`.

 - Apply Catppuccin theme for Cool-Retro-Term:
   - Launch Cool-Retro-Term.
   - Right-click on the window and select "Settings".
   - In the General panel, click "Import" and select the file `home/.config/cool-retro-term-style.json`.
   - Select the imported profile named "catppuccin-theme".
   - Click "Load" and exit from "Settings".

  - Login to your accounts.

  - Customize graphical applications to suit your preferences.
