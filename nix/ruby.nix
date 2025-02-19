{
  mkRuby,
  mkRubyVersion,
  bundler,
}:
(mkRuby {
  version = mkRubyVersion "3" "3" "4" "";
  hash = "sha256-/mow+X1U4Cl2jy3fSSNpnEFs28Om6W2z4tVxbH25ajQ=";
  cargoHash = "sha256-GeelTMRFIyvz1QS2L+Q3KAnyQy7jc0ejhx3TdEFVEbk=";
}).override
  { inherit bundler; }
