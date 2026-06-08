{
  description = "NixOS: Home Manager + Flake Config";

  inputs = {
    # System package repository (Stable channel)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home Manager framework
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
      hostname = "nixos";
      username = "hal9000";
    in {
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix

            # Integrate Home Manager as a system module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # Use the username variable to load home.nix
              home-manager.users."${username}" = import ./home.nix;
            }
          ];
        };
      };
    };
}

