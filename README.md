# giveawaypicker

This is the CLI tool created to find the winners of the "[August Giveaway 🏖️](https://x.com/tiagodhenriques/status/1823786925989535927)" for all subscribers of the iOS Coffee Break Newsletter.

Congratulations to the winners 🎉!

## Usage: Building and Running from Source

To use this tool, first clone this project. Then, in the root directory, use SPM to build and run the executable:

```sh
swift run giveawaypicker -i <supabase_reference_id> -k <supabase_key>
```

## Script: Build for macOS

To start, create a directory named scripts, and inside it script named build-arm64-macos.sh. You can run these commands to do so:

```sh
mkdir scripts
touch build-arm64-macos.sh
```

Then, in your preferred text editor, add the following lines.

```sh
#!/bin/sh

set -e

swift build -c release --product giveawaypicker
BUILD_PATH=$(swift build -c release --product giveawaypicker --show-bin-path)
echo -e "\n\nBuild at ${BUILD_PATH}"

DESTINATION="builds/giveawaypicker-macos"
if [ ! -d "builds" ]; then
    mkdir "builds"
fi

cp "$BUILD_PATH/giveawaypicker" "$DESTINATION"
echo "Copied binary to $DESTINATION"
```

Before running the script locally to test it, make sure to add executable permissions to it:

```sh
chmod +x scripts/build-arm64-macos.sh
```

Now, you can run it to check it builds and stores the binary in the correct location. Because the first line contains the shebang in the first line (#!/bin/sh), you can ommit the sh prefix:

```sh
./scripts/build-arm64-macos.sh
```
