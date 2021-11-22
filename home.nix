{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  imports = [
    ./modules/general.nix
    ./modules/cli.nix
    ./modules/dev.nix
  ];

  # TODO handle cros-platform $HOME
  home.username = "theocodes";
  home.homeDirectory = "/Users/theocodes";

  programs.home-manager.enable = true;
  home.stateVersion = "21.11"; # do not change me!
}
