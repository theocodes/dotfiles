{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    DOTFILES = "$HOME/dotfiles";
    GOPATH = "$HOME/go";
    TERM = "xterm-256color";
    FABPATH = "$HOME/Code/github.com/zencoder";
  };

  home.sessionPath = [
    "$HOME/dotfiles/bin"
    "$HOME/.elixir-ls/release"
    "$HOME/.emacs.d/bin"
    "$HOME/.cargo/bin"
    "/opt/homebrew/bin"
    "$HOME/Code/github.com/zencoder/bolt-utils/bin"
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
      be = "bundle exec";
      b = "bat";
    };

    initExtra = builtins.readFile ../config/zsh/functions.zsh;

    initExtraFirst = ''
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
    '';
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
      s = "status";
    };

    ignores = [ ".envrc" ".DS_Store" ];
    extraConfig = {
      user = {
        name = "Theo Felippe";
        email = "public@theocodes.com";
      };

      pull = {
        rebase = "false";
      };

      init = {
        defaultBranch = "master";
      };

      url = {
        "git@github.com =" = {
          insteadOf = "https =//github.com/";
        };
      };
    };
  };
}
