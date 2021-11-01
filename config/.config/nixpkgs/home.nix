{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "theocodes";
  home.homeDirectory = "/Users/theocodes";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # dev
    lorri direnv
    aws

    go gopls

    # editors
    neovim

    # general
    coreutils
    _1password
  ];

  imports = [
    ./modules/cli.nix
  ];

  home.stateVersion = "21.11";
}
