{ system ? null }:
let this = import ./. { inherit system; };
    nodepkgs = import ./node.nix { pkgs = this.nixpkgs; };
    polymer = import ./polymer.nix { pkgs = this.nixpkgs; };
    reflexEnv = platform: (builtins.getAttr platform this).ghcWithPackages (p: import ./packages.nix { haskellPackages = p; inherit platform; });
in this.nixpkgs.stdenv.mkDerivation { 
  name = "reflex-polymer-shell";
  buildInputs = [
    this.nixpkgs.nodejs
    nodepkgs
    polymer
    this.nixpkgs.nginx
    this.nixpkgs.curl
    this.ghc.cabal-install
    this.ghc.ghcid
    this.ghc.cabal2nix
  ] ++ builtins.map reflexEnv this.platforms;

  shellHook = ""; 

} 
