{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # cli prompt
    starship

    # ls replacement
    exa
  ];
}
