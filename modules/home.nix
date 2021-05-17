args@{ config, pkgs, lib, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "theocodes";
  home.homeDirectory = "/home/theocodes";

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 28800;
    enableSshSupport = true;
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

  home.packages = with pkgs; [
    # Core Apps
    firefox slack vscode
    libvterm alacritty

    sqlite  # for org-roam

    # Fonts
    jetbrains-mono cascadia-code
    font-awesome

    # Core Tools
    jq yq xsel xclip nixfmt gnupg ripgrep
  ];

  home.stateVersion = "20.09"; # don't change this!
}
