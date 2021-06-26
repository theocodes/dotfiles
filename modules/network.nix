{ config, lib, pkgs, ... }:
{
  boot.kernelParams = ["ipv6.disable=1"];

  environment.systemPackages = with pkgs; [
    xl2tpd
    networkmanager-l2tp
    networkmanagerapplet
  ];

  networking = {
    enableIPv6 = false;
    useDHCP = false;

    networkmanager = {
      enable = true;
    };
  };

  # work vpn
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };

  programs.nm-applet.enable = true;
}
