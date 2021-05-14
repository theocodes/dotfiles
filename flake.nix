{
  description = "theocodes system configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {

      nebula = lib.nixosSystem {
        inherit system;

        modules = [
          ./modules/hardware/nebula.nix
          ./modules/system.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.theocodes = {
              imports = [
                ./modules/home.nix
                ./modules/config.nix
                ./modules/wmanager.nix
                ./modules/cli.nix
                ./modules/dev.nix
              ];
            };
          }

        ];
      };

    };
  };
}
