{ config, lib, pkgs, ... }:

{
  xsession.enable = true;
  xsession.scriptPath = ".hm-xsession";

  #xsession.windowManager.xmonad = {
  #  enable = true;
  #  enableContribAndExtras = true;
  #  config = ../config/xmonad/xmonad.hs;
  #};

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

    #extraConfig = ''
    # ...
    #'';

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
     "super + d" = "dmenu_run";
     "super + q" = "bspc node -c";
     "super + shift + q" = "bspc quit";
     "super + shift + r" = "bspc wm -r; /home/theocodes/.dotfiles/bin/launchpolybar";
     "super + Escape" = "pkill -USR1 -x sxhkd";
     "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
     "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
     "super + grave" = "bspc desktop -l next";
     "super + Tab" = "bspc node -f last";
     "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
     "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
    };
  };

  # top panel
  #services.polybar = {
  #  enable = true;

  #  settings = {
  #    "colors" = {
  #      primary = "#4E4187";
  #      alert = "#bd2c40";
  #    };

  #    "bar/main" = {
  #      width = "100%";
  #      height = 27;
  #      font-0 = "CascadiaCode:style=Regular:pixelsize=10;3";
  #      modules-left = "xwindow";
  #      modules-center = "bspwm";
  #      fixed-center = true;
  #      padding-right = 2;
  #      padding-left = 0;
  #      module-margin-left = 0;
  #      module-margin-right = 2;
  #      tray-position = "right";
  #      tray-padding = 2;
  #      cursor-click = "pointer";
  #      cursor-scroll = "ns-resize";
  #      line-size = 3;
  #      line-color = "#f00";
  #    };

  #    "module/bspwm" = {
  #      type = "internal/bspwm";
  #      format = "<label-state> <label-mode>";
  #      label-monitor = "%name%";
  #      label-focused = "%name%";
  #      label-focused-background = "\${colors.primary}";
  #      label-focused-padding =1 ;
  #      label-occupied = "%name%";
  #      label-occupied-padding = 1;
  #      label-urgent = "%name%!";
  #      label-urgent-background = "\${colors.alert}";
  #      label-urgent-padding = 1;
  #      label-empty = "%name%";
  #      label-empty-foreground = "#555";
  #      label-empty-padding = 1;
  #      pin-workspaces = true;
  #    };

  #    "module/xwindow" = {
  #      type = "internal/xwindow";
  #      label = " %title:0:30:...%";
  #    };
  #  };


  #  script = ''
  #    # Terminate already running bar instances
  #    killall -q polybar

  #    # Wait until the processes have been shut down
  #    while pgrep -x polybar >/dev/null; do sleep 1; done

  #    polybar -r main &
  #  '';
  #};

  home.packages = with pkgs; [
    nitrogen rofi dmenu arandr xlockmore
    polybar
  ];

  # notifications
  services.dunst.enable = true;
  
  # compositor for transparency
  services.picom.enable = true;
}
