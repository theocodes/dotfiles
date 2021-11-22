{ config, pkgs, home, ... }:
let
  home = builtins.getEnv "HOME";
in {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  imports = [
    ./modules/general.nix
    ./modules/cli.nix
    ./modules/dev.nix
  ];

  home.username = "theocodes";
  home.homeDirectory = "${home}";

  programs.home-manager.enable = true;
  home.stateVersion = "21.11"; # do not change me!
}
