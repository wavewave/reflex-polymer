{ pkgs ? import <nixpkgs> {} }:
  
pkgs.stdenv.mkDerivation rec { 
  name = "polymer"; 
  version = "1.0.2";
  src = pkgs.fetchurl { 
    #url = "https://github.com/Polymer/tools.git";
    #rev = "02e65ccd6c135146ee2115aa60ce6bad68b55fb4";
    #sha256 = "e58d370a8dc6076de02a3f25f9d892cc0458c70b385feb1e5304c6b80def40b7";
    #url = "http://ianwookim.org/public/polymer/polymer-1.3.0.tar.gz";
    #sha256 = "1l7dq4bcm8nr9321dc95f5bxrnh2xgk093ffbd0fv4fjblflc5d3";
    url = "http://ianwookim.org/public/polymer/polymer-starter-kit-1.2.3-with-google.tar.gz";
    sha256 = "1xrsscvbv8agkmav6fs12dsn8yi3hll09spm6iqxz8knd3fcnj3h";
    
  };
  buildInputs = [ ];

  patches = [ ];

  buildPhase = ''
  ''; 

  installPhase = ''
    mkdir -p $out/polymer
    cp -a * $out/polymer
  '';

  meta = {
    license = pkgs.stdenv.lib.licenses.mit;
  };

}

