{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["ipv6.disable=1"];

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
    firefox xterm

    # Editors
    vim neovim-nightly

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    # Core tools
    gnumake wget killall

    # Work VPN
    xl2tpd
    networkmanager-l2tp
    networkmanagerapplet
  ];

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  networking = {
    hostName = "nebula";
    enableIPv6 = false;

    # TODO will fail on a new machine
    useDHCP = false;
    interfaces.eno2.useDHCP = true;
    interfaces.wlo1.useDHCP = true;

    networkmanager = {
      enable = true;
    };
  };

  # work vpn
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Swap alt and super, caps is an additional escape.
  services.xserver.xkbOptions = "altwin:swap_alt_win,caps:escape";

  # Graphic drivers.
  services.xserver.videoDrivers = [ "nvidia" ];

  #services.xserver.windowManager.bspwm = {
  #  enable = true;
  #  configFile = ../config/bspwm/bspwmrc;

  #  sxhkd = {
  #    configFile = ../config/bspwm/sxhkdrc;
  #  };
  #};

  # Session to delegate starting xsession to home-manager.
  services.xserver.desktopManager.session = [
    {
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$!
      '';
    }
  ];

  system.stateVersion = "20.09"; # dont change this
}
