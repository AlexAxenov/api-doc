{ buildRubyGem, ruby }:
buildRubyGem rec {
  inherit ruby;
  name = "${gemName}-${version}";
  gemName = "bundler";
  version = "2.5.11";
  source.sha256 = "sha256-3XhL/lODSzmlbmQtvG4eyhmi5kVOTVOZTLcpgAWsTC4=";
  dontPatchShebangs = true;
}
