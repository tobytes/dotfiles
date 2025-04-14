{
  description = "My NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };
  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations.toby-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import base configuration
        ./hosts/toby-thinkpad/configuration.nix
      ];
    };
  };
}
