{pkgs,...}:
let 
  spl_es_es = builtins.fetchurl {
    url="https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl";
    sha256="1qvv6sp4d25p1542vk0xf6argimlss9c7yh7y8dsby2wjan3fdln";
  };

  spl_es_latin1 = builtins.fetchurl {
    url="https://ftp.nluug.nl/pub/vim/runtime/spell/es.latin1.spl";
    sha256="0h8lhir0yk2zcs8rjn2xdsj2y533kdz7aramsnv0syaw1y82mhq7";
  };

  spell_folder = "./.config/nvim/spell";
in {

  home.packages = with pkgs; [
    ripgrep
    lua-language-server
    nil
    hyprls
    rust-analyzer
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    svelte-language-server
    taplo #TOML
    tinymist #Typst
    tree-sitter
    fd
  ];

  home.file = {
    "./.config/nvim"= {
      source = "${./nvim}";
      recursive = true;
    };

    "${spell_folder}/es.utf-8.spl" = { source = spl_es_es;};
    "${spell_folder}/es.latin1.spl" = { source = spl_es_latin1;};
  };


  #  NixOS way alternative
  # imports = [ inputs.nvf.homeManagerModules.default ];
	#  programs.nvf = {
	#    enable = true;
	#    # your settings need to go into the settings attribute set
	#    # most settings are documented in the appendix
	#    settings = {
	#      vim = {
	#        viAlias = false;
	#        vimAlias = true;
	#
	# theme = {
	#   enable = true;
	#   name = "rose-pine";
	#   style = "main";
	# };
	#
	#
	# languages = {
	#   enableLSP = true;
	#   enableTreesitter = true;
	#
	#   nix.enable = true;
	#   ts.enable = true;
	#   rust.enable = true;
	# };
	#
	# telescope.enable = true;
	# autocomplete.nvim-cmp.enable = true;
	#      };
	#    };
	#  };
}
