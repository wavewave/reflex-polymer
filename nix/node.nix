{ pkgs }:

with pkgs;
let
  nodePackages = import <nixpkgs/pkgs/top-level/node-packages.nix>
    {
      inherit pkgs;
      inherit (pkgs) stdenv nodejs fetchurl fetchgit;
      self = nodePackages;
      generated = ./node-gen.nix;
    };
in nodePackages."http-server"
