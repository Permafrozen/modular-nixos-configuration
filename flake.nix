{
  description = "Configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix";

    home-manager = { 
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, stylix, ...}:
    let
      vars = import ./core/system/variables.nix;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; #package architecture for homemanager
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;

        modules = [
          
          ./core/system/configuration.nix

          # Stylix Module
          stylix.nixosModules.stylix
        
          # Home-Manager Configuration
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = {
                ${vars.username} = import ./core/system/home.nix;
              };
            };
          }
        ];

      };
    }; 
  };
}
