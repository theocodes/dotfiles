{ config, lib, pkgs, ... }:

{
  # default go for tooling etc
  programs.go = {
    enable = true;
    package = pkgs.go_1_16;
    packages = {};
  };
}
