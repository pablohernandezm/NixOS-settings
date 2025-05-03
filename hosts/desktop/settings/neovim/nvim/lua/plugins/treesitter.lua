return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = {
    ensure_installed = {
      'css',
      'typescript',
      'javascript',
      'html',
      'svelte',
      'bash',
      'sql',
      'nix',
      'hyprlang',
      'rust',
      'markdown',
      'toml'
    },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require 'nvim-treesitter.configs'.setup(opts)
  end
}
