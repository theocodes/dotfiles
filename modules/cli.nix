{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    DOTFILES = "$HOME/dotfiles";
    GOPATH = "$HOME/Go";
    TERM = "xterm-256color";
    FABPATH = "$HOME/Code/github.com/zencoder";
    EDITOR = "nvim";
    GOSUMDB = "off";
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
      rel = "unset __HM_SESS_VARS_SOURCED && exec $SHELL";
      work = "tmux new-session -A -s work";
      play = "tmux new-session -A -s play";
      lg = "lazygit";
      be = "bundle exec";
      b = "bat";
      e = "$EDITOR";
    };

    initExtra = builtins.readFile ../config/zsh/functions.zsh;

    initExtraFirst = ''
      # enable emacs style keybindings
      bindkey -e

      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
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

    ignores = [ ".envrc" ".DS_Store" "*.log" ];
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
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };
}
