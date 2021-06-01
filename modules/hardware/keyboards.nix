{ config, lib, pkgs, modulesPath, ... }:
{
  hardware.keyboard.zsa.enable = true;

  environment.systemPackages = with pkgs; [
    # qmk_firmware
    qmk

    # ergodox flashing
    wally-cli 
  ];

  users.users.theocodes.extraGroups = [ "plugdev" ];
}