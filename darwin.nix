{ config, pkgs, ... }:
{
  # imports = [ <home-manager/nix-darwin> ];

  environment.systemPackages = with pkgs; [
    # editors
    neovim

    alacritty
  ];

  fonts.enableFontDir = true;

  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowUnfree = true;

  # Use a custom configuration.nix location.
  environment.darwinConfig = "/Users/theocodes/dotfiles/darwin.nix";

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  users.users.theocodes = {
    name = "theocodes";
    home = "/Users/theocodes";
  };

  system.stateVersion = 4; # dont change this
}
