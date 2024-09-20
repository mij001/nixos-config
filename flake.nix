{
  description = "Inomal NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cuda-maintainers.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # home-manager, used for managing user configuration

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-flatpak, lanzaboote, ... }: {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          nix-flatpak.nixosModules.nix-flatpak

          lanzaboote.nixosModules.lanzaboote
          ./lanzaboote-sb.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.inomal = import ./home.nix;
            home-manager.sharedModules = [
              inputs.plasma-manager.homeManagerModules.plasma-manager
            ];


            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
