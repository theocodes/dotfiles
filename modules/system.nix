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

  # https://github.com/NixOS/nixpkgs/issues/124215
  documentation.info.enable = false;

  # system level packages
  environment.systemPackages = with pkgs; [
    # core applications
    firefox
    slack
    alacritty
    terminator
    caffeine-ng

    # utils
    gnumake
    wget
    killall
    stow
    git
    xsel
    xclip
    gnupg
    ripgrep
    telnet
    gparted
    woeusb
    ntfs3g

    # screenshots
    flameshot

    # audio
    pamixer
    pavucontrol
  ];

  programs.ssh.startAgent = true;

  services.gnome.gnome-keyring.enable = true;

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "20.09"; # dont change this
}
