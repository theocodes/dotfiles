{ config, lib, pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/scripts"
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "exa -la";
    };
    
    shellAbbrs = {
      vim = "nvim";
      e = "nvim";
      rel = "exec $SHELL";
    };

    interactiveShellInit = ''
      function fish_greeting; end
    '';
    
    functions = {
      signin = "eval (op signin felippe.1password.com)";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.autojump = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    # ls replacement
    exa
  ];
}
