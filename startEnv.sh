#!/usr/bin/env bash

if [ ! -f "./result/bin/esp-idf-env" ]; then
    echo "Running <<nix-build shell.nix>>"
    nix-build shell.nix
fi

./result/bin/esp-idf-env -c "source esp-idf/export.sh && exec bash"