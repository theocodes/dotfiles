{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat exa lazygit
    httpie gnupg tmux
    jq yq peco ripgrep
    gh _1password
  ];

  home.sessionVariables = {
    GOPATH = "$HOME/go";
    FABPATH = "$HOME/repos/github.com/zencoder";
  };

  home.sessionPath = [
    "$HOME/dotfiles/bin"
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;

    shellAliases = {
      ll = "exa -la";
      vim = "nvim";
      rel = "exec $SHELL";
      config = "cd ~/dotfiles && nvim ~/dotfiles";
      work = "tmux new-session -A -s work";
      lg = "lazygit";
    };

    initExtra = builtins.readFile ../config/zsh/functions.zsh;
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
    };

    ignores = [ ".envrc" ];
    extraConfig = {
      user = {
        name = "Theo Felippe";
        email = "public@theocodes.com";
      };

      url = {
        "git@github.com =" = {
          insteadOf = "https =//github.com/";
        };
      };
    };
  };
}
