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
    rust-analyzer exercism

    # golang
    go_1_16
    goimports gopls godef

    # rust
    rustup

    # haskell
    # ghc cabal-install stack
  ];
}
