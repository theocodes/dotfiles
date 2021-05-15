{ config, lib, pkgs, ... }:

{
  # xmobar config
  home.file.".xmobarrc".source = ../config/xmonad/.xmobarrc;

  # some icon files
  home.file.".xmonad/xpm".source = ../config/xmonad/xpm;

  # alacritty config
  home.file.".config/alacritty".source = ../config/alacritty;

  # rofi
  home.file.".config/rofi/config.rasi".source = ../config/rofi/config.rasi;
}