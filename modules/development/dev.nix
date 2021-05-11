{ config, lib, pkgs, ... }:

{
  # project environment management
  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  # default go for tooling etc
  programs.go = {
    enable = true;
    package = pkgs.go_1_16;
    packages = {};
  };
}
