{pkgs,...}:{

  home.packages = with pkgs; [
    lua-language-server
    nil
    hyprls
    rust-analyzer
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    svelte-language-server
  ];

  home.file = {
    "./.config/nvim"= {
      source = "${./nvim}";
      recursive = true;
    };
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
