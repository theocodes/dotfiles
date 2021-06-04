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

      # dwm-overlay = (self: super: {
      #   dwm = super.dwm.overrideAttrs (_: {
      #     src = builtins.fetchGit {
      #       url = "https://github.com/theocodes/dwm";
      #       rev = "19f6a8278ad261dd04f634508929535978915f23";
      #       ref = "master";
      #     };
      #   });
      # });

      overlays = ({ pkgs, ... }: {
        nixpkgs.overlays = with inputs;
          [
            neovim-nightly-overlay.overlay
            # dwm-overlay
          ];
      });

      lib = nixpkgs.lib;
    in {

      nixosConfigurations = {

        nebula = lib.nixosSystem {
          inherit system;

          modules = [ overlays ] ++ [
            ./modules/hardware/nebula.nix
            ./modules/hardware/keyboards.nix
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

          modules = [ overlays ] ++ [
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
