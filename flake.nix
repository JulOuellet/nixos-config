{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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

    nvim-config.url = "github:JulOuellet/nvim-config";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    walker,
    zen-browser,
    firefox-addons,
    nvim-config,
    catppuccin,
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
        ];
      };
      nixos-system76 = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit walker zen-browser firefox-addons;};
        modules = [
          ./hosts/system76/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      julien = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit system walker zen-browser firefox-addons nvim-config catppuccin;};
        modules = [
          ./users/julien/home.nix
          zen-browser.homeModules.default
          catppuccin.homeModules.catppuccin
          ./modules/user/catppuccin.nix
        ];
      };
      julien-wrk = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit system walker zen-browser firefox-addons nvim-config;};
        modules = [
          ./users/julien-wrk/home.nix
          zen-browser.homeModules.default
        ];
      };
      julien-ubuntu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit system nvim-config;};
        modules = [
          ./users/julien-ubuntu/home.nix
          {targets.genericLinux.enable = true;}
        ];
      };
    };
  };
}
