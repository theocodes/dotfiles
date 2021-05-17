{ config, lib, pkgs, ... }:

{
  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession";

  xsession.windowManager.xmonad = {
    enable = false;
    enableContribAndExtras = true;
    config = ../config/xmonad/xmonad.hs;
  };

  # window manager
  xsession.windowManager.bspwm = {
    enable = true;

    monitors = {
      "DP-2" = ["I" "II" "III" "IV" "V" "VI"];
    };

    rules = {
      "Emacs" = {
        state = "tiled";
      };
    };

    settings = {
      "focus_follows_pointer" = true;
      "border_width" = 1;
    };

    startupPrograms = [
      "/home/theocodes/.dotfiles/bin/fixmonitors"
      "/home/theocodes/.dotfiles/bin/launchpolybar"
      "nitrogen --restore"
      "nm-applet"
    ];
  };

  # keybindings daemon
  services.sxhkd = {
    enable = true;
    keybindings = {
     "super + Return" = "alacritty";
     "super + d" = "rofi -show drun -modi drun,run -show-icons -theme config.rasi";
     "super + q" = "bspc node -c";
     "super + shift + q" = "/home/theocodes/.dotfiles/bin/powermenu";
     "super + shift + r" = "bspc wm -r;pkill -USR1 -x sxhkd; /home/theocodes/.dotfiles/bin/launchpolybar";
     "super + Escape" = "pkill -USR1 -x sxhkd";
     "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
     "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
     "super + grave" = "bspc desktop -l next";
     "super + Tab" = "bspc node -f last";
     "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
     "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
    };
  };

  home.packages = with pkgs; [
    nitrogen rofi dmenu arandr xlockmore
    polybar haskellPackages.xmobar trayer
  ];

  # notifications
  services.dunst.enable = true;
  
  # compositor for transparency
  services.picom.enable = false;
}
