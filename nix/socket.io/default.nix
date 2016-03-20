{ socket.io ? { outPath = ./.; name = "socket.io"; }
, pkgs ? import <nixpkgs> {}
}:
let
  nodePackages = import "${pkgs.path}/pkgs/top-level/node-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv nodejs fetchurl fetchgit;
    neededNatives = [ pkgs.python ] ++ pkgs.lib.optional pkgs.stdenv.isLinux pkgs.utillinux;
    self = nodePackages;
    generated = ./get.nix;
  };
in rec {
  tarball = pkgs.runCommand "socket.io-1.4.5.tgz" { buildInputs = [ pkgs.nodejs ]; } ''
    mv `HOME=$PWD npm pack ${socket.io}` $out
  '';
  build = nodePackages.buildNodePackage {
    name = "socket.io-1.4.5";
    src = [ tarball ];
    buildInputs = nodePackages.nativeDeps."socket.io" or [];
    deps = [ nodePackages.by-spec."engine.io"."1.6.8" nodePackages.by-spec."socket.io-parser"."2.2.6" nodePackages.by-spec."socket.io-client"."1.4.5" nodePackages.by-spec."socket.io-adapter"."0.4.0" nodePackages.by-spec."has-binary"."0.1.7" nodePackages.by-spec."debug"."2.2.0" ];
    peerDependencies = [];
  };
}