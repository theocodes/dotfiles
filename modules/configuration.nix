args@{ config, lib, pkgs, modulesPath, ... }:
let
  vars = { hostname = "nebula"; };
  additionalArgs = args // vars;

  extendArguments = module: import module additionalArgs;
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

    # work vpn
    xl2tpd
    networkmanager-l2tp
    networkmanagerapplet
  ];

  imports =
    [ <home-manager/nixos> ]
    ++ map extendArguments [
      ./common/hardware.nix
      ./common/networking.nix
      ./common/users.nix
      ./services/xserver.nix
    ];

  home-manager.users.theocodes = import ./home.nix args;
  system.stateVersion = "20.09"; # dont change this
}
