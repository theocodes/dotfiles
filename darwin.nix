{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    # per-project env
    lorri direnv

    # better cat
    bat

    # better ls
    exa

    # multiplexer
    tmux

    # data query
    jq yq peco ripgrep

    # shell prompt
    starship

    # better curl
    httpie

    # git gui
    lazygit

    # 1password cli
    _1password

    # editor
    neovim

    # crypto
    gnupg

    # config linking
    stow
  ];

  nixpkgs.config.allowUnfree = true;

  # Use a custom configuration.nix location.
  environment.darwinConfig = "/Users/theocodes/dotfiles/darwin.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
