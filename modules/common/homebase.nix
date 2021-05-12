args@{ config, pkgs, lib, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "theocodes";
  home.homeDirectory = "/home/theocodes";

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

  home.stateVersion = "20.09"; # don't change this!
}
