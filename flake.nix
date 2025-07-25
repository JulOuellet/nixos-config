{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in 
    {

    nixosConfigurations = {
      nixos-thinkpad = lib.nixosSystem {
        inherit system;
        modules = [
	  ./hosts/thinkpad-t480/configuration.nix
	  stylix.nixosModules.stylix
	];
      };
    };

    homeConfigurations = {
      julien = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
	  ./users/julien/home.nix
	  stylix.homeModules.stylix
	];
      };
    };

  };
}
