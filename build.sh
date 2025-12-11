#!/usr/bin/env bash
URL="https://github.com/CrowCpp/Crow/releases/download/v1.3.0/Crow-1.3.0-win64.zip"
ZIP="${URL##*/}"
DIR="${ZIP%.zip}"
mkdir -p .build
cd .build

# Download the release
if [ ! -f "$ZIP" ]; then
  echo "Downloading $ZIP from $URL ..."
  curl -L "$URL" -o "$ZIP"
  echo ""
fi

# Unzip the release
if [ ! -d "$DIR" ]; then
  echo "Unzipping $ZIP to .build/ ..."
  cp "$ZIP" "$ZIP.bak"
  unzip -q "$ZIP"
  rm "$ZIP"
  mv "$ZIP.bak" "$ZIP"
  echo ""
fi
cd ..

# Copy the libs to the package directory
echo "Copying libs to crow/ ..."
rm -f crow.h
rm -rf crow/
cp -rf ".build/$DIR/include/crow.h" .
cp -rf ".build/$DIR/include/crow" .
echo ""
