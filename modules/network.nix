{ config, lib, pkgs, ... }:
{
  boot.kernelParams = ["ipv6.disable=1"];

  environment.systemPackages = with pkgs; [
    xl2tpd
    networkmanager-l2tp
    networkmanagerapplet
  ];

  # TODO pass in the hostname
  # TODO handle different interfaces
  networking = {
    hostName = "nebula";
    enableIPv6 = false;

    useDHCP = false;
    interfaces.eno2.useDHCP = true;
    interfaces.wlo1.useDHCP = true;

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
