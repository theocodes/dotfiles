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
    awscli kubectl

    # rust
    rustup

    # clang
    cmake gcc

    # elixir
    elixir

    # ruby
    ruby
  ];
}
