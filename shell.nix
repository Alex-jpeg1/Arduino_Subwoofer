{ pkgs ? import <nixpkgs> {} }:

pkgs.buildFHSEnv {
  name = "esp-idf-env";
  targetPkgs = pkgs: with pkgs; [
    git wget gnumake cmake ninja ccache
    flex bison gperf pkg-config
    python3 python3Packages.pip python3Packages.virtualenv
    dfu-util libusb1 glibc zlib ncurses5 systemd
    clang-tools
  ];
  profile = ''
    export IDF_TOOLS_PATH="$PWD/.espressif"
    echo "Started the enviroment"
  '';
  runScript = "bash";
}