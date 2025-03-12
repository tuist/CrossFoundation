#!/usr/bin/env bash
# MISE description="Build the Zig project and generate C headers"

set -eo pipefail

OUTPUT_DIR="build"
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
            cp "zig-out/lib/CrossFoundation.lib" "$OUTPUT_DIR/${ARCH}-${OS}/lib/CrossFoundation.lib"
        else
            cp "zig-out/lib/libCrossFoundation.a" "$OUTPUT_DIR/${ARCH}-${OS}/lib/libCrossFoundation.a"
        fi

        cp "cross.h" "$OUTPUT_DIR/${ARCH}-${OS}/include/cross.h"
    done
done

