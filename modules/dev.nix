{ config, lib, pkgs, ... }:

{
  # project environment management
  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    # tools
    awscli github-cli kubectl
    rust-analyzer #neovim-nightly
    exercism

    # golang
    go_1_16
    goimports gopls

    # haskell
    ghc cabal-install stack gmp
  ];
}
