{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim neovim-nightly vscode

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    sqlite  # for org-roam
  ];

}
