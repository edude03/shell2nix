with import <nixpkgs> {};

let 
  shell2nix = callPackage ./../default.nix {};

  test = shell2nix ./test.sh;

  drv = callPackage test {};
in 
 mkShell {
     buildInputs = [] ++ drv;
 }