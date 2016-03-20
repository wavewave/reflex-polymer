{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let ghcjsPackages = import ./default.nix; 
in
{
  ghcjs = ghcjsPackages.ghcjsCompiler ;
}

