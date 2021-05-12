{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Prepare for flake
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # allow proprietary
  nixpkgs.config.allowUnfree = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # system level packages
  environment.systemPackages = with pkgs; [
    # Core applications
    wget vim firefox

    # Editors
    neovim
    # neovim-nightly

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))


    # Window manager support
    dunst picom nitrogen
    dmenu

    # Needed for DWM
    xorg.xsetroot

    # Work VPN
    xl2tpd
    networkmanager-l2tp
    networkmanagerapplet
  ];

  # home-manager.users.theocodes = import ./home.nix args;
  system.stateVersion = "20.09"; # dont change this
}
