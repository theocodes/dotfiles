{ config, lib, pkgs, ... }:

{
  # xmobar config
  home.file.".xmobarrc".source = ../config/xmonad/.xmobarrc;

  # some icon files
  home.file.".xmonad/xpm".source = ../config/xmonad/xpm;

  # doom emacs config
  home.file.".doom.d".source = ../config/doom;

  # alacritty config
  home.file.".config/alacritty".source = ../config/alacritty;
}
