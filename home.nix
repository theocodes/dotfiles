{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow proprietary stuff
  nixpkgs.config.allowUnfree = true;

  # use nvim overlay until 0.5.0 is out
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  home.packages = with pkgs; [
    # Core Apps
    firefox slack emacs vscode

    # Development
    awscli github-cli kubectl
    rust-analyzer neovim-nightly
    sqlite  # for org-roam
    goimports gopls

    # Fonts
    jetbrains-mono cantarell-fonts
    noto-fonts

    # Core Tools
    jq yq xsel xclip nixfmt gnupg
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 28800;
    enableSshSupport = true;
  };

  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Theo Felippe";
    userEmail = "public@theocodes.com";
    signing.key = "E05424AC8FC7FB3D12DD";
    signing.signByDefault = false;

    extraConfig = {
      url = {
        "git@github.com:" = { insteadOf = "https://github.com/"; };
      };
    };

    ignores = [ ".envrc" "shell.nix" ];
  };

  home.username = "theocodes";
  home.homeDirectory = "/home/theocodes";

  programs.go = {
    enable = true;
    package = pkgs.go_1_16;
    packages = {};
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = { ll = "ls -lahG --color=auto"; };
  };

  home.sessionPath = [ "$HOME/.dotfiles/bin" ];

  home.sessionVariables = {
    ALTERNATE_EDITOR = "";
    EDITOR = "emacsclient -c";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {};
  };

  programs.alacritty = {
    enable = true;
    settings = {
      selection.save_to_clipboard = true;

      background_opacity = 0.94;
      font = {
        size = 11;
        normal.family = "JetBrains Mono";
        offset.x = -1;
      };

      window.padding = {
        x = 10;
        y = 10;
      };
    };
  };

  home.stateVersion = "20.09";
}
