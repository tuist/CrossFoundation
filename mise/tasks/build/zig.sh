#!/usr/bin/env bash
# MISE description="Build the Zig project and generate C headers"

set -eo pipefail

OUTPUT_DIR="native"
ARCHS=("x86_64" "aarch64")

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

for OS in linux windows macos; do
    for ARCH in "${ARCHS[@]}"; do
        TARGET="${ARCH}-${OS}"
        
        # Build the Zig code
        zig build -Dtarget="$TARGET"
        
        mkdir -p "$OUTPUT_DIR/${ARCH}-${OS}/lib"
        mkdir -p "$OUTPUT_DIR/${ARCH}-${OS}/include"

        if [[ "$OS" == "windows" ]]; then
            cp "zig-out/lib/CrossFoundation.lib" "$OUTPUT_DIR/${ARCH}-${OS}/lib/Cross.lib"
        else
            cp "zig-out/lib/libCrossFoundation.a" "$OUTPUT_DIR/${ARCH}-${OS}/lib/libCross.a"
        fi

        cp "Cross.h" "$OUTPUT_DIR/${ARCH}-${OS}/include/Cross.h"
        cp "module.modulemap" "$OUTPUT_DIR/${ARCH}-${OS}/include/module.modulemap"
    done
done

