{ config, pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/dotfiles/bin"
    "$HOME/repos/github.com/zencoder/bolt-utils/bin"
    "$HOME/go/bin"
  ];

  home.sessionVariables = {
    FABPATH = "$HOME/repos/github.com/zencoder";
  };

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

    initExtraFirst = "
      if [ -e /Users/theocodes/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/theocodes/.nix-profile/etc/profile.d/nix.sh; fi
      source /usr/local/opt/asdf/libexec/asdf.fish
    ";

    initExtra = builtins.readFile ../../zsh/functions.zsh;
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fish = {
    enable = true;

    plugins = [
      {
        name="foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
    ];

    shellInit = ''
     # nix
     if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
         fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
     end

     # home-manager
     if test -e ~/.nix-profile/etc/profile.d/nix.sh
         fenv source ~/.nix-profile/etc/profile.d/nix.sh
     end
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    gh
    exa
    jq yq
    lazygit
    tmux
  ];
}
