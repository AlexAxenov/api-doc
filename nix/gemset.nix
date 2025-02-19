{
  lib,
  defaultGemConfig,
  ruby,
  bundlerEnv,
  # Passed via callPackage.
  environment ? "",
  without ? [ ],
}:
let
  # Append suffix to derivation names to make things pretty.
  environmentSuffix = if environment == "" then "" else "-" + environment;

  groups = [
    "default"
    "production"
    "development"
  ];

  # Pin bundler to the version we use.
  bundlerGemConfig = {
    bundler = {
      groups = [ "default" ];
      platforms = [ ];
      source = {
        remotes = [ "https://rubygems.org" ];
        sha256 = "sha256-JJzQdaxPM1rnD3iMm+D0wYgJOk2n0FvVO+K67z8l58s=";
        type = "gem";
      };
      version = "2.5.3";
    };
  };

  defaultGemConfigOverriden = defaultGemConfig.override {
    ruby = rubyOverriden;
  };

  gemConfig = lib.removeAttrs defaultGemConfigOverriden [
    # Same as above, but drops dependency on libvips entirely (since it’s not
    # reachable in our code).
    "ruby-vips"
  ];
in
(bundlerEnv {
  name = "pact-gems${environmentSuffix}";

  ruby = rubyOverriden;

  gemfile = ../Gemfile;
  lockfile = ../Gemfile.lock;
  gemset = bundlerGemConfig // import ../gemset.nix;

  groups = lib.subtractLists without groups;

  inherit gemConfig;
})
// {
  # Uh, passthru seems to be unused unless we set pname which is not what we
  # want in our case. For context, pname is set when packaging Ruby programs
  # that are defined in Gemfile, Gemfile.lock and gemset.nix, while we are
  # building an environment with dependencies.
  inherit environment environmentSuffix without;
}
