{ config, lib, pkgs, ... }:

{
  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession";

  xsession.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ../config/xmonad/xmonad.hs;
      extraPackages = haskellPackages : [
        haskellPackages.xmobar
      ];
    };
  };

  # compositor for transparency
  services.picom.enable = true;

  # notifications
  services.dunst.enable = true;
}
