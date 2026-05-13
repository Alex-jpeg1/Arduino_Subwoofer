{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    gnumake
    avrdude
    pkgsCross.avr.buildPackages.gcc
  ];
  shellHook = ''
    echo " Environment ready for atmega328p "
  '';
}
