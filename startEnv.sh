#!/usr/bin/env bash

nix-build shell.nix

./result/bin/esp-idf-env -c "source esp-idf/export.sh && exec bash"