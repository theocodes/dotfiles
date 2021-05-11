{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      selection.save_to_clipboard = true;

      background_opacity = 0.98;
      font = {
        size = 11;
        normal.family = "Cascadia Mono";
        offset.x = -1;
      };

      window.padding = {
        x = 10;
        y = 10;
      };
    };
  };
}
