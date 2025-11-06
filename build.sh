#!/bin/bash

# Create build directory if it doesn't exist
if [ -d "immich-export.lrplugin" ]; then
    echo "Build directory already exists."
else
    echo "Creating immich-export.lrplugin"
    mkdir immich-export.lrplugin
fi

echo "Compiling LUA files"
for f in immich-plugin.lrplugin/*.lua; do
    luac -o "immich-export.lrplugin/$(basename "$f")" "$f"
done

echo "Copying other files"
rsync -a --exclude='*.lua' immich-plugin.lrplugin/ immich-export.lrplugin/

echo "Build finished."
