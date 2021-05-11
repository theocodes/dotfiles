args@{ config, lib, pkgs, modulesPath, ... }:
let hostname = "nebula";
in {
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # allow proprietary
  nixpkgs.config.allowUnfree = true;

  # graphic drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # system level packages
  environment.systemPackages = with pkgs; [
    wget vim firefox

    dunst picom nitrogen
    dmenu

    xorg.xsetroot
  ];

  networking = {
    hostName = hostname;
    enableIPv6 = false;

    useDHCP = false;
    interfaces.eno2.useDHCP = true;
    interfaces.wlo1.useDHCP = true;

    networkmanager = {
      enable = true;
      enableStrongSwan = true;
      packages = with pkgs; [
        xl2tpd
        networkmanager-l2tp
        networkmanagerapplet
      ];
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  imports = [ (./hardware + "/${hostname}.nix") ]; # <home-manager/nixos>

  #home-manager.users.theocodes = import ./home.nix args;

  system.stateVersion = "20.09"; # dont change this
}
