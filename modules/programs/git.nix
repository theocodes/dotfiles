{ config, lib, pkgs, ... }:

{
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
}
