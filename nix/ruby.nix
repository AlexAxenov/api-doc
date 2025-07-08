{
  mkRuby,
  mkRubyVersion,
  bundler,
}:
(mkRuby {
  version = mkRubyVersion "3" "4" "4" "";
  hash = "sha256-oFl7/fMS4BDv0e/6qNfx14MxRv3BeVDKqBWP+j3L+oU=";
  cargoHash = "sha256-kdfNY8wVmSRR+cwEDYge/HDPRvdTNKLk/BhgqQeelOg=";
}).override
  { inherit bundler; }
