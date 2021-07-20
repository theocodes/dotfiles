{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    vscode

    # emacs with vterm
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    sqlite  # for org-roam
  ];
}
