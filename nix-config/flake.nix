{
  description = "My NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # A collection of NixOS modules covering hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # Home manager used to manage user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixos-hardware, home-manager, ...}@inputs: {
    nixosConfigurations.toby-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Hardware config for thinkpad x230 
        nixos-hardware.nixosModules.lenovo-thinkpad-x230

        # Import base configuration
        ./hosts/toby-thinkpad/configuration.nix

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true; # Use global nixpkgs of system
          home-manager.useUserPackages = true; # Install packages to /etc/profiles instead of $HOME/.nix-profile
          home-manager.users.toby = import ./hosts/toby-thinkpad/home.nix;
        }
      ];
    };
  };
}
