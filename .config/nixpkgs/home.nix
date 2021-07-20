{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "theocodes";
  home.homeDirectory = "/home/theocodes";

  # allow non-free
  nixpkgs.config.allowUnfree = true;

  # enable re-indexing of installed fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # data
    jq yq

    # core tools
    stow ripgrep

    # password manager
    _1password

    # fonts
    jetbrains-mono
  ];

  imports = [
    ./modules/cli.nix
    ./modules/editors.nix
    ./modules/dev.nix
  ];

  home.stateVersion = "21.11";
}
