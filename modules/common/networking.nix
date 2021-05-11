args@{ config, lib, pkgs, hostname, ... }:

{
  networking = {
    hostName = hostname;
    enableIPv6 = false;

    # TODO will fail on a new machine
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

}
