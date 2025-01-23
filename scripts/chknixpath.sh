if [ "$#" -ne 2 ]; then
    echo "Usage: chknixpath <package> <tree level>"
    exit 1
fi

PACKAGE=$1
TREE_LEVEL=$2

OUTPUT_PATH=$(nix build nixpkgs#"$PACKAGE" --print-out-paths --no-link)

if [ $? -ne 0 ]; then
    echo "$OUTPUT_PATH"
    echo "Error: Failed to build or retrieve the package path."
    exit 1
fi

eza --tree --level "$TREE_LEVEL" "$OUTPUT_PATH"
