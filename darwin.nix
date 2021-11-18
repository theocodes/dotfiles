{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # cli tools
    bat exa gh tmux
    jq yq peco ripgrep
    httpie lazygit

    # shell prompt
    starship

    # 1password cli
    _1password

    # editor
    neovim

    # general tools
    gnupg cmake stow

    # dev
    lorri direnv
    rustup
  ];

  fonts.enableFontDir = true;

  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;

  # Use a custom configuration.nix location.
  environment.darwinConfig = "/Users/theocodes/dotfiles/darwin.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  system.stateVersion = 4; # dont change this
}
