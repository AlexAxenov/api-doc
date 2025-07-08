{ buildRubyGem, ruby }:
buildRubyGem rec {
  inherit ruby;
  name = "${gemName}-${version}";
  gemName = "bundler";
  version = "2.6.6";
  source.sha256 = "sha256-gysquNKtbj0nUTj7ZA3z021IGOFC0Tsne0SIZxG4l2E=";
  dontPatchShebangs = true;
}
