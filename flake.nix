{
  description = "theocodes system configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, darwin, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        config = { allowUnfree = true; };
      };

      overlays = ({ pkgs, ... }: {
        nixpkgs.overlays = with inputs;
          [
            neovim-nightly-overlay.overlay
          ];
      });

      lib = nixpkgs.lib;
      dlib = darwin.lib;
    in {

      darwinConfigurations = {
        rapture = dlib.darwinSystem {
          modules = [ overlays ] ++ [ 
            ./modules/darwin.nix
            ./modules/cli.nix
            ./modules/editors.nix
	          ./modules/dev.nix
          ];
        };
      };

      nixosConfigurations = {
        nebula = lib.nixosSystem {
          inherit system;

          modules = [ overlays ] ++ [
            ./modules/hardware/nebula.nix
            ./modules/hardware/keyboards.nix
            ./modules/nixos.nix
            ./modules/network.nix
            ./modules/desktop.nix
            ./modules/cli.nix
            ./modules/dev.nix
            ./modules/editors.nix
            ./modules/gaming.nix
          ];
        };

        bioshock = lib.nixosSystem {
          inherit system;

          modules = [ overlays ] ++ [
            ./modules/hardware/bioshock.nix
            ./modules/nixos.nix
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
