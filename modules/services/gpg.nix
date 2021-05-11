{ config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 28800;
    enableSshSupport = true;
  };
}
