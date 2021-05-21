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
    firefox slack vscode
    alacritty terminator

    # Editors
    vim neovim-nightly

    sqlite  # for org-roam
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    # Core tools
    gnumake wget killall stow git
    jq yq xsel xclip nixfmt gnupg ripgrep
    _1password pinentry_gtk2 libnotify

    # desktop
    dunst nitrogen dmenu arandr
    xlockmore polybar picom rofi

    # cli
    fish zsh starship
    exa peco

    # dev
    direnv

    # tools
    awscli github-cli kubectl
    rust-analyzer exercism

    # golang
    go_1_16
    goimports gopls godef

    # rust
    rustup
  ];

  fonts.fonts = with pkgs; [
    jetbrains-mono cascadia-code
    font-awesome
  ];

  users.users.theocodes = {
    isNormalUser = true;
    hashedPassword =
      "$6$nCMdQaHrRiC0W$KTsvDnO7.bu6MBKR9Nl4wabZkH5AdwFBLCrmY7Cmn88g3gpO7X9qEDFPLJQlbU.qPTHiTt196/IeZdtJdSlMz0";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Swap alt and super, caps is an additional escape.
  services.xserver.xkbOptions = "altwin:swap_alt_win,caps:escape";

  # Graphic drivers.
  services.xserver.videoDrivers = [ "nvidia" ];

  # window manager
  services.xserver.windowManager.herbstluftwm.enable = true;

  # gpg
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2";
  };

  services.lorri.enable = true;

  system.stateVersion = "20.09"; # dont change this
}
