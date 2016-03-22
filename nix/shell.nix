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

  shellHook = ''
    cat << EOF > nginx.conf
    events {
      worker_connections 1024;
    }

    http {
      include ${this.nixpkgs.nginx}/conf/mime.types;
      server {
        listen 8080;
        location /app {
          root ${polymer}/polymer;
          autoindex on;
        }
        location /newtest.jsexe {
          root $PWD/newtest;
        }
        location / {
          root $PWD;
        } 
      }
    }
    EOF
  '';

} 
