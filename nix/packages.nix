{ lib, newScope }:
lib.makeScope newScope (
  self:
  let
    inherit (self) callPackage;
  in
  {
    appSource = callPackage ./app.nix { };

    bundler = callPackage ./bundler.nix { };

    ruby = callPackage ./ruby.nix { };
    inherit (self.ruby) devEnv;

    gemset = callPackage ./gemset.nix { };
    inherit (self.gemset) wrappedRuby;

    gemset-small = self.gemset.override {
      without = [
        "development"
        "test"
      ];
    };
  }
)
