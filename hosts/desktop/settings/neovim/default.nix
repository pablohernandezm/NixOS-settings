{pkgs, ...}: let
  spl_es_es = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl";
    sha256 = "1qvv6sp4d25p1542vk0xf6argimlss9c7yh7y8dsby2wjan3fdln";
  };

  spl_es_latin1 = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/es.latin1.spl";
    sha256 = "0h8lhir0yk2zcs8rjn2xdsj2y533kdz7aramsnv0syaw1y82mhq7";
  };
  configs = [
    {
      name = "main";
      opts = {
        source = "${./nvim}";
        recursive = true;
      };
    }
    {name = "test";}
  ];

  global_sub_files = [
    {
      name = "spell/es.utf-8.spl";
      opts = {source = spl_es_es;};
    }
    {
      name = "spell/es.latin1.spl";
      opts = {source = spl_es_latin1;};
    }
  ];
  folder = ".config";
in {
  home.file = builtins.listToAttrs (
    []
    ++ (
      builtins.map (c: {
        name = "${folder}/nvim-${c.name}";
        value = c.opts;
      })
      (builtins.filter (x: builtins.hasAttr "opts" x) configs)
    )
    ++ (
      builtins.concatMap (f:
        builtins.map (c: {
          name = "${folder}/nvim-${c.name}/${f.name}";
          value = f.opts;
        })
        configs)
      global_sub_files
    )
  );

  home.packages = with pkgs; [
    # utils
    ripgrep
    tree-sitter
    fd

    # formatters
    alejandra
    stylua
    typstyle
    pgformatter
    rustfmt

    # lsp
    lua-language-server
    nil
    rust-analyzer
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    svelte-language-server
    hyprls
    taplo #TOML
    tinymist #Typst
    postgres-lsp
  ];
}
