#!/bin/sh

# If any of the commands fails with an error, make the script exit early with an error, by using the set -e command.
set -e

# Build the single executable target, in the release configuration.
# Following that, use the --show-bin-path argument to store the path where the resulting binary will be at.
swift build -c release --product giveawaypicker
BUILD_PATH=$(swift build -c release --product giveawaypicker --show-bin-path)
echo -e "\n\nBuild at ${BUILD_PATH}"

# Define the destination path, where you’ll place the executable at. Create the builds folder if necessary, and use the cp command to copy it.
DESTINATION="builds/giveawaypicker-macos"
if [ ! -d "builds" ]; then
    mkdir "builds"
fi

cp "$BUILD_PATH/giveawaypicker" "$DESTINATION"
echo "Copied binary to $DESTINATION"
