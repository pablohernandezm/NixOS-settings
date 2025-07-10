{pkgs, ...}:
pkgs.writeShellApplication {
  name = "nixpath";
  text = ''
    set -euo pipefail

    # Check number of arguments
    if [[ $# -ne 2 ]]; then
        echo "Usage: chknixpath <package> <tree level>" >&2
        exit 1
    fi

    PACKAGE=$1
    TREE_LEVEL=$2

    # Attempt to get the output path
    if ! OUTPUT_PATH=$(nix build "nixpkgs#$PACKAGE" --print-out-paths --no-link 2>&1); then
        echo "$OUTPUT_PATH" >&2
        echo "Error: Failed to build or retrieve the package path." >&2
        exit 1
    fi

    # Use eza to explore the result
    eza --tree --level "$TREE_LEVEL" "$OUTPUT_PATH"
  '';
}
