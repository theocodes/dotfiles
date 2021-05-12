args@{ config, pkgs, lib, ... }:
let
  extendArguments = module: import module args;
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "theocodes";
  home.homeDirectory = "/home/theocodes";

  # Allow proprietary stuff
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Core Apps
    firefox slack vscode
    libvterm

    # Development
    awscli github-cli kubectl
    rust-analyzer #neovim-nightly
    sqlite  # for org-roam
    goimports gopls

    # Fonts
    jetbrains-mono cascadia-code

    # Core Tools
    jq yq xsel xclip nixfmt gnupg
  ];

  imports = map extendArguments [
    ./terminal/shell.nix
    ./services/gpg.nix
    ./programs/git.nix
    ./programs/alacritty.nix
    ./development/env.nix
    ./development/go.nix
  ];

  home.stateVersion = "20.09"; # don't change this!
}
