{
  description = "My NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # A collection of NixOS modules covering hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = { self, nixpkgs, nixos-hardware, ...}@inputs: {
    nixosConfigurations.toby-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Hardware config for thinkpad x230 
        nixos-hardware.nixosModules.lenovo-thinkpad-x230
        # Import base configuration
        ./hosts/toby-thinkpad/configuration.nix
      ];
    };
  };
}
