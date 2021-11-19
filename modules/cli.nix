{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal
    tmux starship

    # general tools
    bat exa lazygit stow
    httpie gnupg

    # data tools
    jq yq peco ripgrep

    # other
    gh _1password
  ];
}
