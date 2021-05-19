{ config, pkgs, lib, ... }:
{
  home.sessionPath = [
    "$HOME/.dotfiles/bin"
    "$HOME/.emacs.d/bin"
    "$HOME/repos/github.com/zencoder/bolt-utils/bin"
  ];

  home.sessionVariables = {
    ALTERNATE_EDITOR = "";
    EDITOR = "emacsclient -c";
    GOSUMDB = "off";
    DOOMDIR = "$HOME/.dotfiles/config/doom";
    FABPATH = "$HOME/repos/github.com/zencoder";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -lahG --color=auto";
      e = "emacsclient -c -n";
      vim = "nvim";

      # run last command with sudo
      please = "sudo $(fc -ln -1)";

      # reload profile
      rel = "exec $SHELL -l";
    };

    initExtra = builtins.readFile ../config/zsh/functions.zsh;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {};
  };
}
