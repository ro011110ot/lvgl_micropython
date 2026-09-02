#!/bin/bash
# Apply uncommitted build patches to lib/micropython submodule
# Run from the project root (lvgl_micropython/)
set -e

PATCH_DIR="$(dirname "$0")"
PATCH_FILE="$PATCH_DIR/lib_micropython_build_patches.patch"

if [ ! -f "$PATCH_FILE" ]; then
    echo "ERROR: Patch file not found: $PATCH_FILE"
    exit 1
fi

if [ ! -d "lib/micropython" ]; then
    echo "ERROR: lib/micropython not found. Run 'git submodule update --init --recursive' first."
    exit 1
fi

echo "Applying lib/micropython build patches..."
cd lib/micropython
git apply --3way "../../$PATCH_FILE"
cd ../..

echo "Done. Patches applied successfully."
