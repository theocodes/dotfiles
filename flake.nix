{
  description = "theocodes system configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = { allowUnfree = true; };
    };

    overlays = ({ pkgs, ... }: {
      nixpkgs.overlays = with inputs; [
        neovim-nightly-overlay.overlay
      ];
    });

    lib = nixpkgs.lib;
  in {

    nixosConfigurations = {

      # desktop
      nebula = lib.nixosSystem {
        inherit system;

        modules = [overlays] ++ [
          ./modules/hardware/nebula.nix
          ./modules/system.nix
        ];
      };

      # laptop
      redawn = lib.nixosSystem {
        inherit system;

        modules = [overlays] ++ [
          ./modules/hardware/redawn.nix
          ./modules/system.nix
        ];
      };

    };
  };
}
