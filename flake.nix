{
  description = "SnO2WMaN's rust tools overlay";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    overlays.default = (import ./overlay.nix);
  };
}
