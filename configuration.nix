{ config, pkgs, ... }: { imports = [ ./hardware-configuration.nix ];
  # Bootloader
  boot.loader.grub.enable = true; boot.loader.grub.device = "/dev/sda"; 
  boot.loader.grub.useOSProber = true;
  # Networking
  networking.hostName = "nixos"; networking.networkmanager.enable = true;
  # Timezone and locale
  time.timeZone = "Europe/Istanbul"; i18n.defaultLocale = "en_US.UTF-8"; 
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8"; LC_IDENTIFICATION = "tr_TR.UTF-8"; LC_MEASUREMENT = 
    "tr_TR.UTF-8"; LC_MONETARY = "tr_TR.UTF-8"; LC_NAME = "tr_TR.UTF-8"; LC_NUMERIC = 
    "tr_TR.UTF-8"; LC_PAPER = "tr_TR.UTF-8"; LC_TELEPHONE = "tr_TR.UTF-8"; LC_TIME = 
    "tr_TR.UTF-8";
  };
  # Wayland setup
  services.xserver.enable = false;
  # Display manager SDDM with Wayland
  services.displayManager.sddm.enable = true; services.displayManager.sddm.wayland.enable 
  = true;
  # XDG portal (for Flatpak / Wayland apps)
  xdg.portal.enable = true; xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
  xdg.portal.config.common.default = "*";
  # Keymaps
  console.keyMap = "trq";
  # Printing
  services.printing.enable = true;
  # Sound
  services.pulseaudio.enable = false; security.rtkit.enable = true; services.pipewire = { 
    enable = true; alsa.enable = true; alsa.support32Bit = true; pulse.enable = true;
  };
  # User account
  users.users.max = { isNormalUser = true; description = "Max"; extraGroups = [ 
    "networkmanager" "wheel" ];
  };
  # Firefox + Flatpak
  programs.firefox.enable = true; services.flatpak.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # System packages
  environment.systemPackages = with pkgs; [ waybar hyprland git foot xfce.thunar rofi-wayland swaybg swww fastfetch starship cosmic-edit
  ];
  
  fonts = {
  packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.caskaydia-cove
    font-awesome
  ];
};


  # System version
  system.stateVersion = "25.05";

programs.hyprland.enable = true;

}
