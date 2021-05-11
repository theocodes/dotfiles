{ config, lib, pkgs, ... }:

{
  # project environment management
  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
