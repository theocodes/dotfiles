{ config, lib, pkgs, ... }:

{
  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession";

  xsession.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ../config/xmonad/xmonad.hs;
    };
  };

  home.packages = with pkgs; [
    nitrogen trayer picom
    dmenu rofi arandr xlockmore
    haskellPackages.xmobar
  ];

  # notifications
  services.dunst.enable = true;
}
