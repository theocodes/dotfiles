{ config, lib, pkgs, ... }:
{

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2";
  };

  environment.systemPackages = with pkgs; [
    # prompt
    starship

    # shell
    fish zsh 

    # ls replacement
    exa

    # for gpg agent 
    pinentry_gtk2

    # cli tool
    _1password  

    # data quering
    jq yq peco
  ];

}
