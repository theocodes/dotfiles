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

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # use nvim overlay until 0.5.0 is out
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  # system level packages
  environment.systemPackages = with pkgs; [
    wget vim neovim-nightly firefox

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

  imports = [
     <home-manager/nixos>
    (./hardware + "/${hostname}.nix")
     ./services/xserver.nix
  ];

  home-manager.users.theocodes = import ./home.nix args;
  system.stateVersion = "20.09"; # dont change this
}
