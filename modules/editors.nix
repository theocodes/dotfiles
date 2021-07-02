{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim vscode
    neovim-nightly

    # emacs with vterm
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    sqlite  # for org-roam
  ];
}
