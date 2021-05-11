{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable GNOME.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # graphic drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
}
