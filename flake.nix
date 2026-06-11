{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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

    claude-code.url = "github:sadjow/claude-code-nix";

    nixgl.url = "github:nix-community/nixGL";
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
    claude-code,
    nixgl,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos-thinkpad = lib.nixosSystem {
        inherit system;
        specialArgs = {};
        modules = [
          ./hosts/thinkpad-t480/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      julien = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit system walker zen-browser firefox-addons nvim-config catppuccin claude-code;};
        modules = [
          ./users/julien/home.nix
          zen-browser.homeModules.default
          catppuccin.homeModules.catppuccin
          ./modules/user/catppuccin.nix
        ];
      };

      julien-ubuntu = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit system nvim-config nixgl;};
        modules = [
          ./users/julien-ubuntu/home.nix
          {targets.genericLinux.enable = true;}
        ];
      };
    };
  };
}
