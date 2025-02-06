return {
  -- JavaScript/TypeScript support
  {
    "pangloss/vim-javascript",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      vim.g.javascript_plugin_jsdoc = 1
      vim.g.javascript_plugin_ngdoc = 1
    end,
  },

  -- TypeScript support
  {
    "leafgarland/typescript-vim",
    ft = { "typescript", "typescriptreact" },
  },

  -- JSX/TSX support
  {
    "maxmellon/vim-jsx-pretty",
    ft = { "javascriptreact", "typescriptreact", "jsx" },
  },

  -- Emmet support for ease of writing html
  {
    "mattn/emmet-vim",
    ft = { "html", "jsx" },
  },

  -- HTML5 support
  {
    "othree/html5.vim",
    ft = { "html", "htmldjango" },
  },

  -- CSS support
  {
    "ap/vim-css-color",
    ft = { "css", "jsx", "scss", "sass" },
  },
}
