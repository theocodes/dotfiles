{ config, lib, pkgs, ... }:

{
  # symlink non-nix configuration
  home.file.".doom.d".source = config.lib.file.mkOutOfStoreSymlink ../config/doom;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../config/nvim;
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink ../config/alacritty;
  home.file.".config/tmux".source = config.lib.file.mkOutOfStoreSymlink ../config/tmux;
}
