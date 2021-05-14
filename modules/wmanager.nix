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

  # compositor for transparency
  #services.picom.enable = true;

  # notifications
  services.dunst.enable = true;
}
