{
  description = "SnO2WMaN's rust tools overlay";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    overlays.default = (final: prev: {

      taplo-cli = prev.taplo-cli.overrideAttrs (old: rec {
        inherit (old) pname;
        version = "0.6.2";
        src = prev.fetchCrate {
          inherit pname;
          inherit version;
          sha256 = "sha256-vz3ClC2PI0ti+cItuVdJgP8KLmR2C+uGUzl3DfVuTrY=";
        };
        cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
          inherit src;
          name = "${old.pname}-${version}-vendor.tar.gz";
          outputHash = "sha256-m6wsca/muGPs58myQH7ZLPPM+eGP+GL2sC5suu+vWU0=";
        });
      });

      treefmt = prev.treefmt.overrideAttrs (old: rec {
        inherit (old) pname;
        version = "0.4.1";
        src = prev.fetchFromGitHub {
          owner = "numtide";
          repo = "treefmt";
          rev = "v${version}";
          sha256 = "sha256-+EcqrmjZR8pkBiIXpdJ/KfmTm719lgz7oC9tH7OhJKY=";
        };
        cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
          inherit src;
          name = "${pname}-${version}-vendor.tar.gz";
          outputHash = "sha256-DXsKUeSmNUIKPsvrLxkg+Kp78rEfjmJQYf2pj1LWW38=";
        });
      });

    });
  };
}
