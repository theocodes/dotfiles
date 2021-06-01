{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim vscode
    neovim-nightly

    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    sqlite  # for org-roam
  ];

}
