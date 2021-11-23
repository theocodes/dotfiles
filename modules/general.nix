{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim

    bat exa lazygit
    httpie gnupg tmux
    jq yq peco ripgrep
    gh _1password
  ];

  # symlink non-nix configuration
  home.file.".doom.d".source = config.lib.file.mkOutOfStoreSymlink ../config/doom;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ../config/nvim;
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink ../config/alacritty;
  home.file.".config/tmux".source = config.lib.file.mkOutOfStoreSymlink ../config/tmux;
  # home.file.".config/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink ../config/lazygit.yml;
  home.file."Library/Application Support/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink ../config/lazygit.yml;
}
