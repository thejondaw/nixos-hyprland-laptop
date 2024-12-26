## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files.

   🚨 Ensure that you configure USBGuard in the `nixos/usb.nix` file to avoid potential issues. By default, USBGuard blocks all USB devices, which can lead to the disabling of crucial hardware components such as the integrated camera, bluetooth, wifi, etc. To configure USBGuard properly, add your trusted USB devices to the configuration. You can obtain a list of all connected devices by using the `lsusb` command from the `usbutils` package.

    Failure to configure USBGuard appropriately may result in the inability to connect any USB devices to your machine. If needed, you can also disable USBGuard altogether by setting `services.usbguard.enable` to `false` in the configuration:`services.usbguard.enable = false;`. This step ensures that USBGuard is not actively blocking any USB devices.

   🚨 Also, important: If you use disk encryption with LUKS and want to use encrypted swap, you need to enable swap on LUKS. This is usually auto-generated in `/etc/nixos/configuration.nix` as the `boot.initrd.luks.devices."luks-...".device = "/dev/disk/by-uuid/...";` code block, if you set this option up during the NixOS installation process. You can simply copy this snippet to either `nixos/swap.nix`, `nixos/hardware-configuration.nix`, or `nixos/configuration.nix` (Personally, I prefer to copy it to `hardware-configuration.nix`).

   Alternatively, you can set it up manually or use [swap encryption with a random key](https://nixos.wiki/wiki/Swap#Encrypt_swap_with_random_key).

4. To change the default username and/or hostname, run the command `rg --hidden 'jondaw'` to find and fix all instances of the username, and `rg --hidden 'isitreal-laptop'` for the hostname. 🚨 Make sure to change the username to match yours set during installation to avoid login issues. 🚨 Also, don't forget to delete or change to yours the git settings in `home/.gitconfig`, `home/projects/.gitconfig.personal`, and `home/work/.gitconfig.work` files, as they are configured for my personal use.
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

  After this, you will have a complete system.

## ⌨️ Keybindings

### Main

| Key Combination        | Action                       |
|------------------------|------------------------------|
| ALT + R                | Resize windows mode          |
| ALT + M                | Move windows mode            |
| SUPER + H, J, K, L     | Change window focus          |
| SUPER + 1..0           | Change workspace             |
| SUPER + SHIFT + 1..0   | Move window to workspace     |
| SUPER + SHIFT + Q      | Kill active window           |
| SUPER + SHIFT + F      | Toggle floating window       |
| SUPER + CTRL + F       | Toggle full-screen           |
| SUPER + SHIFT + O      | Toggle split                 |
| SUPER + SHIFT + P      | Toggle pseudo                |
| SUPER + SHIFT + M      | Exit from `hyprland`         |
| SUPER + CTRL + E       | Expose all windows using `pyprland` |
| SUPER + CTRL + M       | Expose all minimized windows using `pyprland` |
| SUPER + M              | Minimize or restore a window using `pyprland` |
| SUPER + CTRL + T       | Launch scratchpad with `wezterm` using `pyprland` |
| SUPER + CTRL + V       | Launch scratchpad with `pavucontrol` using `pyprland` |
| SUPER + T              | Launch `wezterm`             |
| SUPER + D              | Launch `rofi -drun`          |
| SUPER + B              | Launch `qutebrowser`         |
| SUPER + SHIFT + B      | Launch `brave`               |
| SUPER + F              | Launch `thunar`              |
| SUPER + ESCAPE         | Launch `wlogout`             |
| SUPER + S              | Launch `spotify`             |
| SUPER + Y              | Launch `youtube-music`       |
| SUPER + SHIFT + D      | Launch `discord`             |
| SUPER + SHIFT + T      | Launch `telegram`            |
| SUPER + SHIFT + L      | Launch `hyprlock`            |
| SUPER + SHIFT + S      | Take screenshot              |
| SUPER + E              | Launch `swappy` to edit last taken screenshot |
| SUPER + R              | Record screen area (MP4)     |
| SUPER + SHIFT + R      | Record screen area (GIF)     |
| SUPER + C              | Launch color picker (using `hyperpicer`) |
| SUPER + Z              | Toggle Zoom (with `pyprland`)|
| SUPER + V              | Launch clipboard menu (`rofi -dmenu`) |
| SUPER + SHIFT + V      | Launch clipboard menu (`rofi -dmenu`) (copy to clipboard) |
| SUPER + X              | Launch clipboard deletion item menu (`rofi -dmenu`) |
| SUPER + SHIFT + X      | Clear clipboard             |
| SUPER + U              | Launch bookmark menu (`rofi -dmenu`) |
| SUPER + SHIFT + U      | Add text from clipboard to bookmark |
| SUPER + CTRL + U       | Launch bookmark deletion item menu (`rofi -dmenu`) |
| SUPER + SHIFT + A      | Toggle airplane mode        |
| SUPER + SHIFT + N      | Toggle notifications        |
| SUPER + SHIFT + Y      | Toggle bluetooth            |
| SUPER + SHIFT + W      | Toggle wifi                 |
| SUPER + P              | Toggle play-pause player    |
| SUPER + ]              | Player next track           |
| SUPER + [              | Player previous track       |

You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.

## 🐟 Useful aliases in Fish Shell

This system includes a fish shell configuration file (`/home/.config/fish/config.fish`) that provides various aliases to enhance your experience working with it.

Common commands:
- `cl`: clear the terminal screen (shorthand for `clear`)
- `lgit`: launch the `lazygit` command-line Git client
- `ldocker`: launch the `lazydocker` command-line Docker client
- `conf`: navigate to the `~/.config` directory

NixOS-specific commands:
- `nswitch`: rebuild your system using the current flake
- `nswitchu`: rebuild and update your system using the current flake
- `nau`: add the unstable channel to the package manager
- `nsgc`: optimize the nix store and remove unreferenced and obsolete store paths (equivalent to `sudo nix-store --gc`)
- `ngc`: delete all old generations of user profiles (equivalent to `sudo nix-collect-garbage -d`)
- `ngc7`: delete generations of user profiles older than 7 days (equivalent to `sudo nix-collect-garbage --delete-older-than 7d`)
- `ngc14`: delete generations of user profiles older than 14 days (equivalent to `sudo nix-collect-garbage --delete-older-than 14d`)
- `nixos`: navigate to the `/etc/nixos` directory
- `store`: navigate to the `/nix/store` directory

You can customize this configuration by adding more aliases to the file and editing existing ones. This makes your experience more personalized and smoother.

## 🦀 Useful info for Rustaceans

Here are some tips to enhance your Rust experience on this system:

1. **Installation Customization:**
   This system utilizes [rust-overlay](https://github.com/oxalica/rust-overlay) for Rust installation using the Nix approach. To customize the installation, including modifications to compilation targets, components, channels, or profiles, follow these steps:

   - Locate the `nixos/rust-toolchain.toml` file and make the necessary adjustments based on your requirements.

   - If you are working on multiple projects with distinct `rust-toolchain.toml` files or need to switch between stable and nightly Rust versions, consider the following options:

     - Set up a Nix environment using `flake.nix` and [rust-overlay](https://github.com/oxalica/rust-overlay) for each project separately. Utilize `nix develop` or `direnv` to manage project-specific Rust environments.

     - Alternatively, you can install `rustup` through `environment.systemPackages` and nixpkgs for a system-wide Rust setup. This allows you to manage Rust versions globally through `rustup`.

2. **Troubleshooting Compilation Issues:**
   If you encounter issues during Rust compilation, particularly those related to OpenSSL, SQLite, Wayland, or any other program utilized by `pkg-config` in the compilation process (see [here](https://nixos.wiki/wiki/Rust#Building_Rust_crates_that_require_external_system_libraries)), you can employ the `nix-shell -p pkg-config {your_dependency} [other_dependencies] --run fish` command. This command opens a Nix shell with the necessary dependencies, facilitating seamless code compilation. Alternatively, you can employ the approach outlined in the initial section (Installation Customization) by utilizing `flake.nix` with dev shell instead of `nix-shell`.
   Moreover, when using the Nix Dev shell, be aware that the compilation takes place in the runtime directory, which might be insufficient for certain projects. To address this, you can adjust the runtime directory size in the `nixos/users.nix` file under `services.logind.extraConfig="RuntimeDirectorySize=8G"`.

3. **Cross-Compilation:**
   For cross-compilation, consider using tools like `zigbuild` or `cross`. Personally, I find `zigbuild` preferable, but both are valuable options for your cross-compilation needs.

4. **Cargo and Rust Tools:**
   This system comes equipped with a variety of cargo and rust tools to ensure a smooth Rust development experience. Some of these tools include:
   - `rust-analyzer`
   - `cargo-watch`
   - `cargo-deny`
   - `cargo-audit`
   - `cargo-update`
   - `cargo-edit`
   - `cargo-outdated`
   - `cargo-license`
   - `cargo-tarpaulin`
   - `cargo-cross`
   - `cargo-zigbuild`
   - `cargo-nextest`
   - `cargo-spellcheck`
   - `cargo-modules`
   - `cargo-bloat`
   - `cargo-unused-features`
   - `bacon`

5. **Environment Setup:**
   You can set up your Rust project environment on this system using `nix develop` or `nix-shell` with `default.nix`, `shell.nix`, or `flake.nix` to create a tailored environment for your Rust project (Also, I personally recommend using it alongside with [direnv](https://direnv.net/)).

## 🔑 Yubikey on NixOS
This repo contains a NixOS configuration file (`nixos/yubikey.nix`) enabling:

  - Yubikey authentication with pam_u2f
  - Passwordless login in greetd, sudo, ssh, and hyprlock

🚨 Personal Recommendation:  While convenient, using a Yubikey for display managers (like greetd) and screen lockers (like hyprlock) without  additional two-factor or multi-factor authentication (2FA/MFA) has risks. If your Yubikey is lost or stolen, someone could gain full system access before you reset keys. Yubikeys excel at protecting against online attacks but are less secure against offline attacks.

🛡️ For enhanced security and a passwordless experience:
  You can consider a YubiKey Bio Series device. These keys support FIDO2/WebAuthn and FIDO U2F and has built in fingerprint scanner for strong authentication. Please note, they do not offer Smart card, OpenPGP, or OTP functionality.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
