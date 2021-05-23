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

      nebula = lib.nixosSystem {
        inherit system;

        modules = [overlays] ++ [
          ./modules/hardware/nebula.nix
          ./modules/system.nix
          ./modules/network.nix
          ./modules/desktop.nix
          ./modules/cli.nix
          ./modules/dev.nix
          ./modules/editors.nix
          ./modules/gaming.nix
        ];
      };

      redawn = lib.nixosSystem {
        inherit system;

        modules = [overlays] ++ [
          ./modules/hardware/redawn.nix
          ./modules/system.nix
          ./modules/network.nix
          ./modules/desktop.nix
          ./modules/cli.nix
          ./modules/dev.nix
          ./modules/editors.nix
        ];
      };

    };
  };
}
