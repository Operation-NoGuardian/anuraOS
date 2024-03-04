#!/bin/bash
cd "$(dirname "$0")"
# Submodules
git submodule update --init
# wasm, otherwise npm gives an ugly error
rustup target add wasm32-unknown-unknown
# make
if ! groups $USER | grep -q "docker"; then
  echo Please add yourself to group docker or don\'t build rootfs
fi
make all
