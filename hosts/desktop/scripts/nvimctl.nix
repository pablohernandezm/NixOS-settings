{pkgs}:
pkgs.writeShellApplication {
  name = "nvimctl";
  runtimeInputs = [pkgs.fzf];
  text = ''
    set -euo pipefail

    CONFIG_DIR="$HOME/.config"
    NVIM_SYMLINK="$CONFIG_DIR/nvim"

    # Buscar configuraciones
    config_path=$(fd --max-depth 1 --type d --glob 'nvim-*' "$CONFIG_DIR" | fzf --prompt="Neovim Configs > " --height=50% --layout=reverse --border --exit-0)

    [[ -z "$config_path" ]] && echo "No config selected" && exit 0

    config_name=$(basename "$config_path")

    # Manejo de symlink
    if [ -e "$NVIM_SYMLINK" ]; then
      if [ ! -L "$NVIM_SYMLINK" ]; then
        echo ".config/nvim ya existe y no es un symlink."
        read -rp "¿Deseas eliminarlo para crear un symlink? [y/N]: " confirm
        case "$confirm" in
          [yY][eE][sS]|[yY])
            rm -rf "$NVIM_SYMLINK"
            ln -s "$CONFIG_DIR/$config_name" "$NVIM_SYMLINK"
            echo "Symlink $HOME/.config/nvim → $config_name creado."
            ;;
          *)
            echo "No se creó el symlink. Ejecutando con NVIM_APPNAME directamente."
            ;;
        esac
      else
        rm "$NVIM_SYMLINK"
        ln -s "$CONFIG_DIR/$config_name" "$NVIM_SYMLINK"
        echo "Symlink ~/.config/nvim → $config_name actualizado."
      fi
    else
      ln -s "$CONFIG_DIR/$config_name" "$NVIM_SYMLINK"
      echo "Symlink ~/.config/nvim → $config_name creado."
    fi

    # Ejecutar Neovim con esa configuración
    NVIM_APPNAME="$config_name" exec nvim "$@"
  '';
}
