{
  description = "Home Manger and NixOS system configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, flake-utils, ... }@inputs:
	flake-utils.lib.eachDefaultSystem(system:
	    let
		username = "will";
		hostname = "nixos";
		pkgs = nixpkgs.legacyPackages.${system};
		
	    in {
		nixosConfigurations."${username}@${hostname}" = nixpkgs.lib.nixosSystem {
		    specialArgs = { inherit inputs; };
		    modules = [
			./configuration.nix
			./hardware-configuration.nix
			./system/desktop-environments/common.nix
		    ];
		};

		homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
		    inherit pkgs;
		    extraSpecialArgs = { inherit inputs username; };
		    modules = [ ./home-manager/home.nix ];
		};
	    }
	);
}
