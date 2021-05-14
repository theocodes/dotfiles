{ config, pkgs, lib, ... }:
{
  home.sessionPath = [
    "$HOME/.dotfiles/bin"
    "$HOME/.emacs.d/bin"
  ];

  home.sessionVariables = {
    ALTERNATE_EDITOR = "";
    EDITOR = "emacsclient -c";
    GOSUMDB = "off";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -lahG --color=auto";
      e = "emacsclient -c -n";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {};
  };
}
