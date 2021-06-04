{ config, lib, pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Swap alt and super, caps is an additional escape.
  services.xserver.xkbOptions = "altwin:swap_alt_win,caps:escape";

  # Graphic drivers.
  services.xserver.videoDrivers = [ "nvidia" ];

  # window manager
  # services.xserver.windowManager.herbstluftwm.enable = true;
  # services.xserver.windowManager.qtile.enable = true;
  services.xserver.displayManager.startx.enable = true;

  environment.systemPackages = with pkgs; [
    # notifications
    libnotify
    dunst

    # background
    nitrogen

    # launchers
    dmenu
    rofi

    # panel
    polybar

    # compositor
    picom

    # session lock
    xlockmore
  ];

  fonts.fonts = with pkgs; [ jetbrains-mono cascadia-code font-awesome ];
}
