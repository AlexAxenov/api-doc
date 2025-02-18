{
  lib,
  runCommand,
  nix-gitignore,
}:
let
  source = nix-gitignore.gitignoreSource extraGitIgnore ./..;

  extraGitIgnore = [
    # Build support
    "/flake.nix"
    "/flake.lock"
    "/nix"
    "/.gitlab-ci.yml"
    "/.envrc"
    # For development
    "/README.md"
    "/Makefile"
    "/Guardfile"
    "/ssh_config"
    # Garbage
    "/vendor"
    "/log"
    "/tmp"
  ];
in
runCommand ""
  {
    pname = "pactApiDoc";
    inherit source;
  }
  ''
    mkdir -p -- "$out"/share
    cp -r -- "$source" "$out"/share/pact
  ''
