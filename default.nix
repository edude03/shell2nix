{ pkgs }:

let 
  shell2nix = script: pkgs.runCommand "shell2nix" { nativeBuildInputs = [pkgs.ruby]; } ''
    ruby ${./produce.rb} ${script} > $out
  '';
in
   shell2nix