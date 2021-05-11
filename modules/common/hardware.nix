args@{ config, lib, pkgs, hostname, ... }:

import (../hardware + "/${hostname}.nix")
