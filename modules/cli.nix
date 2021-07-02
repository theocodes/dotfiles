{ config, lib, pkgs, ... }:
{

  programs.gnupg.agent = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # prompt
    starship

    # shell
    fish zsh 

    # ls replacement
    exa

    # cli tool
    _1password  

    # data quering
    jq yq peco
  ];

  programs.zsh = {
    enable = true;
  };

}
