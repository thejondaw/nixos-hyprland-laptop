## 🛠️ Installation of pure NixOS | Base System Setup

### 🌐 Initial Network Setup | WiFi Configuration

First, let's bring up `wpa_supplicant` and configure wireless connection:

```bash
# Start WPA supplicant service
sudo systemctl start wpa_supplicant

# Configure WiFi connection
wpa_cli
> add_network
> set_network 0 ssid "your_network"
> set_network 0 psk "your_password"
> enable_network 0
> quit
```

### 📦 Preparing Installation Environment

Get `git` for config management:

```bash
# Get git in temporary shell
nix-shell -p git
```

### 💽 Disk Configuration | Using Disko

Download and prepare disk partitioning config:

```bash
# Clone repo with disko config
git clone https://github.com/thejondaw/nix-hypr.git
cd nix-hypr

# Move disko config to tmp
mv disko.nix /tmp/

# Create encryption key
echo -n "password" > /tmp/secret.key

# Run disko for partitioning
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix
```

### 🔧 Base System Configuration

Generate and configure the base system:

```bash
# Generate initial config
sudo nixos-generate-config --root /mnt

# Edit base configuration (add git and home-manager)
sudo vi /mnt/etc/nixos/configuration.nix

# Install the system
sudo nixos-install

# Set root password when prompted
> New password: ***
> Retype new password: ***

# Reboot into new system
reboot
```

### 👤 Post-Install User Setup

After reboot, configure user account:

```bash
# As root, set password for main user
passwd jondaw
> New password: ***
> Retype new password: ***

# Switch to user account
su - jondaw
```

### 🌐 Network Configuration | Using NetworkManager

Setup permanent connection via `nmcli`:

```bash
# List available networks
nmcli dev wifi list

# Connect to network
sudo nmcli dev wifi connect "NETWORK_NAME" password "PASSWORD"
```

### 🏠 Home Manager Setup

Add Home Manager repos and update the system:

```bash
# Add home-manager channel
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager

# Update channels
sudo nix-channel --update

# Rebuild system with new configuration
sudo nixos-rebuild switch
```

---
*💡 Pro tip: Don't forget to backup your `/etc/nixos/configuration.nix` after setup - it'll come in handy for quick deployments on other machines!*
