{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    firefox slack 
    alacritty terminator
    caffeine-ng

    # core tools
    gnumake wget killall stow git
    xsel xclip gnupg ripgrep

    # audio
    pamixer pavucontrol
  ];

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "20.09"; # dont change this
}
