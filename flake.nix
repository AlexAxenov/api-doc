{
  description = "Pact messenger aggregator";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";

    flake-parts.url = "flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    minimal-shell.url = "github:tie-infra/minimal-shell";
    minimal-shell.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem =
        {
          config,
          system,
          lib,
          pkgs,
          pactPackages,
          ...
        }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.minimal-shell.overlays.default ];
          };

          _module.args.pactPackages = pkgs.callPackages ./nix/packages.nix { };

          treefmt = {
            projectRootFile = "flake.nix";
            programs.deadnix.enable = true;
            programs.nixfmt.enable = true;
          };

          packages.devshell = pkgs.buildEnv {
            name = "devshell";
            paths = lib.attrValues {
              inherit (pactPackages)
                devEnv
                ;
            };
          };

          devShells.default = pkgs.mkMinimalShell {
            packages = [ config.packages.devshell ];
          };
        };
    };
}
