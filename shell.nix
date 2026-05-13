{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    cmake
    gnumake
    avrdude
    pkgsCross.avr.buildPackages.gcc
    pkgsCross.avr.libcCross
  ];

  shellHook = ''
    export AVR_CFLAGS="-isystem ${pkgs.pkgsCross.avr.libcCross}/avr/include"
    export AVR_ASFLAGS="-isystem ${pkgs.pkgsCross.avr.libcCross}/avr/include"
    echo "Environment ready for atmega328p"
  '';
}