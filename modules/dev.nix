{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # per-project environments
    lorri direnv

    # general tools
    aws kubectl

    # rust
    rustup

    # clang
    cmake
  ];
}
