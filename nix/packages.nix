{ haskellPackages, platform }:

with haskellPackages;

[
  ##############################################################################
  # Add general packages here                                                  #
  ##############################################################################


] ++ (if platform == "ghcjs" then [
  ##############################################################################
  # Add ghcjs-only packages here                                               #
  ##############################################################################
  containers
  file-embed
  ghcjs-dom
  mtl
  text  
  reflex
  bimap
  data-default
  dependent-sum-template
  #reflex-polymer
  reflex-transformers
] else []) ++ (if platform == "ghc" then [
  ##############################################################################
  # Add ghc-only packages here                                                 #
  ##############################################################################

] else []) ++ builtins.concatLists (map (x: x.override { mkDerivation = drv: drv.buildDepends; }) [ reflex ])

# reflex-polymer ])
