{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    walker,
    zen-browser,
    firefox-addons,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos-thinkpad = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit walker zen-browser firefox-addons;};
        modules = [
          ./hosts/thinkpad-t480/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixos-system76 = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit walker zen-browser firefox-addons;};
        modules = [
          ./hosts/system76/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
    };

    homeConfigurations = {
      julien = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit walker zen-browser firefox-addons;};
        modules = [
          ./users/julien/home.nix
          stylix.homeModules.stylix
          zen-browser.homeModules.default
        ];
      };
      julien-wrk = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit walker zen-browser firefox-addons;};
        modules = [
          ./users/julien-wrk/home.nix
          stylix.homeModules.stylix
          zen-browser.homeModules.default
        ];
      };
      julien-ubuntu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {};
        modules = [
          ./users/julien-ubuntu/home.nix
          stylix.homeModules.stylix
          {targets.genericLinux.enable = true;}
        ];
      };
    };
  };
}
