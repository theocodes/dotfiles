{ config, lib, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    # per-project environments
    lorri

    # general tools
    aws kubectl

    # rust
    rustup

    # clang
    cmake

    # elixir
    elixir
  ];
}
