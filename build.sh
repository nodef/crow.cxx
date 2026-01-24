#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "crow" ]; then return; fi
URL="https://github.com/CrowCpp/Crow/archive/refs/heads/master.zip"
ZIP="${URL##*/}"
DIR="Crow-master"
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
  echo "Unzipping $ZIP to .build/$DIR ..."
  cp "$ZIP" "$ZIP.bak"
  unzip -q "$ZIP"
  rm "$ZIP"
  mv "$ZIP.bak" "$ZIP"
  echo ""
fi
cd ..

# Copy the libs to the package directory
echo "Copying libs to crow/ ..."
rm -rf crow
mkdir -p crow
cp -rf ".build/$DIR/include/crow/"* crow/
cp -f  ".build/$DIR/include/crow.h" crow/
echo ""
}


# Test the project
test() {
echo "Running 01-helloworld.cxx ..."
clang++ -std=c++17 -I. -I./node_modules/asio.cxx -I./node_modules/boost.cxx -o 01.exe examples/01-helloworld.cxx && ./01.exe && echo -e "\n"
# echo "Running 02-with_all.cxx ..."
# clang++ -std=c++17 -I. -I./node_modules/asio.cxx -I./node_modules/boost.cxx -o 02.exe examples/02-with_all.cxx   && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
